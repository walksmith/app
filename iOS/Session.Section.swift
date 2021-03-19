import Foundation
import Smith

extension Session {
    enum Section {
        case
        home,
        listed,
        challenge(Challenge)
    }
}
