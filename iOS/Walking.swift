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
                withAnimation(.spring(blendDuration: 0.3)) {
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
                        .padding(.horizontal, 64)
                        .padding(.vertical, 10)
                }
                .fixedSize()
            }
            Button {
                withAnimation(.spring(blendDuration: 0.3)) {
                    session.archive.cancel()
                }
            } label: {
                Text("CANCEL")
                    .foregroundColor(.secondary)
                    .font(.caption)
                    .frame(width: 300, height: 34)
            }
            .padding(.top, 10)
            .padding(.bottom)
        }
    }
}
