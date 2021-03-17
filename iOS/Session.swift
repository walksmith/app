import Foundation
import Combine
import Smith

struct Session {
    var archive = Archive()
    var player = Player()
    var section = Section.home
    let dismiss = PassthroughSubject<Void, Never>()
}
