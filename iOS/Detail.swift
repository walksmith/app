import SwiftUI
import Smith

struct Detail: View {
    @Binding var session: Session
    let challenge: Challenge
    @State private var leaderboard = false
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation(.spring(blendDuration: 0.3)) {
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
                if session.archive.enrolled(challenge) {
                    Button {
                        leaderboard = true
                    } label: {
                        Image(systemName: "star.fill")
                            .font(.title3)
                            .foregroundColor(.primary)
                            .frame(width: 65, height: 50)
                    }
                    .sheet(isPresented: $leaderboard) {
                        Leaderboards(session: $session, challenge: challenge)
                    }
                }
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
