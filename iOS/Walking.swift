import SwiftUI
import Smith

struct Walking: View {
    @Binding var session: Session
    @State private var challenge: Challenge?
    
    var body: some View {
        VStack {
            Segmented(session: $session, challenge: $challenge)
            Spacer()
            
            switch challenge {
            default:
                Time(session: $session)
            }
            
            Spacer()
            Button {
                withAnimation(.spring(blendDuration: 0.4)) {
                    session.archive.end()
                }
            } label: {
                ZStack {
                    Capsule()
                        .fill(LinearGradient(
                                gradient: .init(colors: [.init(.systemIndigo), .blue]),
                                startPoint: .leading,
                                endPoint: .trailing))
                        .modifier(Shadowed())
                    Text("FINISH")
                        .foregroundColor(.white)
                        .font(Font.callout)
                        .fontWeight(.medium)
                        .padding(.horizontal, 60)
                        .padding(.vertical, 8)
                }
                .fixedSize()
            }
            Button {
                withAnimation(.spring(blendDuration: 0.4)) {
                    session.archive.cancel()
                }
            } label: {
                Text("CANCEL")
                    .foregroundColor(.secondary)
                    .font(.caption)
                    .frame(width: 300, height: 28)
            }
            .padding(.top, 5)
            .padding(.bottom)
        }
    }
}
