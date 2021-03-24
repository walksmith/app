import Foundation
import CoreMotion
import Smith

final class Pedometer {
    private let meter = CMPedometer()
    
    var stepsAvailable: Bool {
        CMPedometer.isStepCountingAvailable() && CMPedometer.authorizationStatus() != .denied
    }
    
    func steps(_ archive: Archive) {
        guard
            stepsAvailable,
            archive.enrolled(.steps),
            let start = archive.last?.start
        else { return }
        meter.startUpdates(from: start) { data, _ in
            print(data?.numberOfSteps)
        }
    }
}
