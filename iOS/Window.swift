import SwiftUI

struct Window: View {
    @Binding var session: Session
    
    var body: some View {
        switch session.section {
        case .home:
            Home(session: $session)
                .transition(.move(edge: .leading))
        case let .challenge(challenge):
            Detail(session: $session, challenge: challenge)
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
        }
    }
}
