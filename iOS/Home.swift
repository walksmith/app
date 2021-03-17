import SwiftUI
import Smith

struct Home: View {
    @Binding var session: Session
    
    var body: some View {
        ScrollView {
            Greet(session: $session)
            Spacer()
                .frame(height: 20)
            ForEach(Challenge.allCases, id: \.self) { challenge in
                Item(session: $session, challenge: challenge)
            }
            Spacer()
                .frame(height: 20)
        }
    }
}
