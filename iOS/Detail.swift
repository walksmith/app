import SwiftUI
import Smith

struct Detail: View {
    @Binding var session: Session
    let challenge: Challenge
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation(.spring(blendDuration: 0.4)) {
                        session.section = .home
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(.secondary)
                        .frame(width: 30, height: 50)
                        .padding(.leading)
                }
                Text(challenge.title)
                    .font(Font.footnote.bold())
                Spacer()
            }
            if session.archive.enrolled(challenge) {
                Spacer()
            } else {
                Spacer()
                Start(session: $session, challenge: challenge)
                Spacer()
            }
        }
    }
}
