import SwiftUI
import Smith

struct Home: View {
    @Binding var session: Session
    
    var body: some View {
        ScrollView {
            Greet(session: $session)
            Spacer()
                .frame(height: 20)
            if case .none = session.archive.status {
                Button {
                    withAnimation(.spring(blendDuration: 0.4)) {
                        session.archive.start()
                    }
                } label: {
                    ZStack {
                        Circle()
                        Image(systemName: "plus")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .frame(width: 60, height: 60)
                }
            }
            Spacer()
                .frame(height: 40)
            ForEach(Challenge.allCases, id: \.self) { challenge in
                Item(session: $session, challenge: challenge)
            }
            Spacer()
                .frame(height: 20)
        }
    }
}
