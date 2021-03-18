import SwiftUI

struct Walking: View {
    @Binding var session: Session
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "figure.walk")
                .font(.largeTitle)
            Counter(session: $session)
                .padding(.bottom)
            Button {
                withAnimation(.spring(blendDuration: 0.4)) {
                    session.archive.end()
                }
            } label: {
                ZStack {
                    Capsule()
                        .fill(LinearGradient(
                                gradient: .init(colors: [.init(.systemTeal), .blue]),
                                startPoint: .leading,
                                endPoint: .trailing))
                        .shadow(color: Color.primary.opacity(0.4), radius: 4, y: 2)
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
                    session.archive.end()
                }
            } label: {
                Text("CANCEL")
                    .foregroundColor(.secondary)
                    .font(.caption)
                    .frame(width: 300, height: 28)
            }
            .padding(.vertical)
        }
    }
}
