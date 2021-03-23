import Foundation
import HealthKit
import Combine
import Smith

final class Health {
    let result = PassthroughSubject<(Challenge, Int), Never>()
    private let store = HKHealthStore()
    
    var available: Bool {
        HKHealthStore.isHealthDataAvailable()
    }
    
    func request(_ challenge: Challenge) {
        store.requestAuthorization(toShare: [], read: [challenge.object]) { _, _ in }
    }
    
    func query(_ archive: Archive, _ challenge: Challenge, _ start: Date) {
        guard available, archive.enrolled(challenge) else {
            result.send((challenge, 0))
            return
        }
        let query = HKStatisticsCollectionQuery(
            quantityType: challenge.quantity,
            quantitySamplePredicate: HKQuery.predicateForSamples(withStart: start, end: .init(), options: [.strictStartDate, .strictEndDate]),
            options: .cumulativeSum,
            anchorDate: start,
            intervalComponents: .init(day: 1))
        query.initialResultsHandler = { [weak self] _, results, _ in
            results?.enumerateStatistics(
                from: start,
                to: .init(),
                with: { result, _ in
                    result.sumQuantity().map {
                        self?.result.send((challenge, .init($0.doubleValue(for: .count()))))
                    }
                }
            )
        }
        store.execute(query)
    }
}

private extension Challenge {
    var object: HKObjectType {
        .quantityType(forIdentifier: identifier)!
    }
    
    var quantity: HKQuantityType {
        .quantityType(forIdentifier: identifier)!
    }
    
    var identifier: HKQuantityTypeIdentifier {
        switch self {
        case .steps: return .stepCount
        default: fatalError()
        }
    }
}
