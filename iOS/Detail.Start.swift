import SwiftUI
import Smith

extension Detail {
    struct Start: View {
        @Binding var session: Session
        let challenge: Challenge
        
        var body: some View {
            Button {
                session.archive.start(challenge)
            } label: {
                ZStack {
                    Circle()
                        .stroke(challenge.background, style: .init(lineWidth: 6))
                        .opacity(0.4)
                    ZStack {
                        Circle()
                            .fill(challenge.background)
                        Text("Start")
                            .font(.callout)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(30)
                    }
                    .padding(3)
                }
                .fixedSize()
            }
        }
    }
}
