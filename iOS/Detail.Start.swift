import SwiftUI
import Smith

extension Detail {
    struct Start: View {
        @Binding var session: Session
        let challenge: Challenge
        
        var body: some View {
            Button {
                session.health.request(challenge) {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        session.archive.start(challenge)
                    }
                }
            } label: {
                ZStack {
                    Circle()
                        .stroke(challenge.background, style: .init(lineWidth: 4))
                        .opacity(0.4)
                        .modifier(Shadowed())
                    ZStack {
                        Circle()
                            .fill(challenge.background)
                        Text("Start")
                            .font(.footnote)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(20)
                    }
                    .padding(2)
                }
                .fixedSize()
            }
        }
    }
}
