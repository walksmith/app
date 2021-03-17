import SwiftUI

struct Walking: View {
    @Binding var session: Session
    
    var body: some View {
        ScrollView {
            Image(systemName: "figure.walk")
                .font(.largeTitle)
                .padding(.top, 40)
            Counter(session: $session)
                .padding(.vertical)
            Button {
                withAnimation(.spring(blendDuration: 0.4)) {
                    session.archive.end()
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                    Text("Finish")
                        .foregroundColor(.white)
                        .font(Font.callout.bold())
                        .padding(.horizontal, 26)
                        .padding(.vertical, 9)
                }
                .fixedSize()
            }
            .padding(.vertical)
        }
    }
}
