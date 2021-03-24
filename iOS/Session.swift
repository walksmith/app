import Foundation
import Combine
import Smith

struct Session {
    var archive = Archive()
    var player = Player()
    var section = Section.home
    let game = Game()
    let health = Health()
    let pedometer = Pedometer()
    let dismiss = PassthroughSubject<Void, Never>()
    let components = DateComponentsFormatter()
    let relative = RelativeDateTimeFormatter()
    let monther = DateFormatter()
    let weeker = DateFormatter()
    let decimal = NumberFormatter()
    
    init() {
        components.allowedUnits = [.minute, .second]
        components.unitsStyle = .positional
        components.zeroFormattingBehavior = .pad
        
        monther.dateFormat = "MMMM"
        weeker.dateFormat = "EEEEE"
        
        decimal.numberStyle = .decimal
    }
}
