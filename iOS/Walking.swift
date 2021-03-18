import SwiftUI

struct Walking: View {
    @Binding var session: Session
    
    var body: some View {
        VStack {
            Image(systemName: "figure.walk")
                .font(.largeTitle)
                .padding(.top, 60)
            Counter(session: $session)
                .padding(.vertical)
            Button {
                withAnimation(.spring(blendDuration: 0.4)) {
                    session.archive.end()
                }
            } label: {
                ZStack {
                    Capsule()
                    Text("FINISH")
                        .foregroundColor(.white)
                        .font(Font.callout)
                        .fontWeight(.medium)
                        .padding(.horizontal, 60)
                        .padding(.vertical, 7)
                }
                .fixedSize()
            }
            .padding()
            Spacer()
        }
    }
}
