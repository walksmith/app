import Foundation
import Combine
import Smith

struct Session {
    var archive = Archive()
    var player = Player()
    var section = Section.home
    let game = Game()
    let dismiss = PassthroughSubject<Void, Never>()
    let components = DateComponentsFormatter()
    let relative = RelativeDateTimeFormatter()
    let monther = DateFormatter()
    let decimal = NumberFormatter()
    
    init() {
        components.allowedUnits = [.minute, .second]
        components.unitsStyle = .positional
        components.zeroFormattingBehavior = .pad
        
        monther.dateFormat = "MMMM"
        
        decimal.numberStyle = .decimal
    }
}
