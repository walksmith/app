import Foundation
import HealthKit
import Combine
import Smith

final class Health {
    private let store = HKHealthStore()
    
    var available: Bool {
        HKHealthStore.isHealthDataAvailable()
    }
    
    func request(_ challenge: Challenge) {
        store.requestAuthorization(toShare: [], read: [challenge.object]) { _, _ in }
    }
    
    func query(_ archive: Archive, _ challenge: Challenge) -> Future<Int, Never> {
        .init { [weak self] promise in
            guard
                self?.available == true,
                archive.enrolled(challenge),
                let start = archive.last?.start
            else {
                return promise(.success(0))
            }
            
            let query = HKStatisticsCollectionQuery(
                quantityType: challenge.quantity,
                quantitySamplePredicate: HKQuery.predicateForSamples(withStart: start, end: .init(), options: [.strictStartDate, .strictEndDate]),
                options: .cumulativeSum,
                anchorDate: start,
                intervalComponents: .init(day: 1))
            
            query.initialResultsHandler = { _, results, _ in
                guard let results = results else { return promise(.success(0)) }
                results.enumerateStatistics(
                    from: start,
                    to: .init(),
                    with: { result, _ in
                        guard let count = result.sumQuantity()?.doubleValue(for: .count()) else {
                            return promise(.success(0))
                        }
                        promise(.success(.init(count)))
                    }
                )
            }
            
            self?.store.execute(query)
        }
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
