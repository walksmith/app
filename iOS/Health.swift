import Foundation
import HealthKit
import Combine
import Smith

final class Health {
    let steps = PassthroughSubject<Int, Never>()
    private var subs = Set<AnyCancellable>()
    private var queries = Set<HKQuery>()
    private let store = HKHealthStore()
    
    var available: Bool {
        HKHealthStore.isHealthDataAvailable()
    }
    
    func clear() {
        guard available else { return }
        queries.forEach(store.stop)
        queries = []
    }
    
    func request(_ challenge: Challenge) {
        store.requestAuthorization(toShare: [], read: [challenge.object]) { _, _ in }
    }
    
    func steps(_ archive: Archive) {
        guard
            available == true,
            archive.enrolled(.steps),
            let start = archive.last?.start
        else { return }
        
        let query = HKStatisticsCollectionQuery(
            quantityType: Challenge.steps.quantity,
            quantitySamplePredicate: HKQuery.predicateForSamples(withStart: start, end: nil, options: .strictStartDate),
            options: .cumulativeSum,
            anchorDate: start,
            intervalComponents: .init(day: 1))
        
        query.initialResultsHandler = { [weak self] _, results, _ in
            results.map {
                self?.steps(start: start, results: $0)
            }
        }
        
        query.statisticsUpdateHandler = { [weak self] _, _, results, _ in
            results.map {
                self?.steps(start: start, results: $0)
            }
        }
        
        store.execute(query)
        queries.insert(query)
    }
    
    private func steps(start: Date, results: HKStatisticsCollection) {
        results.enumerateStatistics(
            from: start,
            to: .init(),
            with: { [weak self] result, _ in
                result.sumQuantity()
                    .map {
                        $0.doubleValue(for: .count())
                    }
                    .map(Int.init)
                    .map {
                        self?.steps.send($0)
                    }
            }
        )
    }
}

private extension Challenge {
    var object: HKObjectType {
        .quantityType(forIdentifier: identifier)!
    }
    
    var quantity: HKQuantityType {
        .quantityType(forIdentifier: identifier)!
    }
    
    private var identifier: HKQuantityTypeIdentifier {
        switch self {
        case .steps: return .stepCount
        default: fatalError()
        }
    }
}
