import SwiftUI
import Smith

extension Detail {
    struct Stop: View {
        @Binding var session: Session
        let challenge: Challenge
        
        var body: some View {
            Button {
                withAnimation(.easeInOut(duration: 0.3)) {
                    session.archive.stop(challenge)
                }
            } label: {
                ZStack {
                    Circle()
                        .stroke(LinearGradient(
                                    gradient: .init(colors: [.pink, .red]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing), style: .init(lineWidth: 4))
                        .opacity(0.4)
                        .modifier(Shadowed())
                    ZStack {
                        Circle()
                            .fill(LinearGradient(
                                    gradient: .init(colors: [.pink, .red]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
                        Text("Stop")
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
