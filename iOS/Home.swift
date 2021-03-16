import SwiftUI

struct Home: View {
    @Binding var session: Session
    
    var body: some View {
        ScrollView {
            Greet(session: $session)
            Spacer()
                .frame(height: 20)
            ForEach(Challenge.allCases, id: \.self) {
                Item(session: $session, challenge: $0)
            }
            Spacer()
                .frame(height: 20)
        }
    }
}
