import SwiftUI
import Smith

struct Home: View {
    @Binding var session: Session
    
    var body: some View {
        ScrollView {
            Greet(session: $session)
                .padding(.top, 40)
            Button {
                withAnimation(.spring(blendDuration: 0.4)) {
                    session.archive.start()
                }
            } label: {
                ZStack {
                    Circle()
                        .fill(LinearGradient(
                                gradient: .init(colors: [.blue, .init(.systemIndigo)]),
                                startPoint: .top,
                                endPoint: .bottom))
                        .modifier(Shadowed())
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                .frame(width: 40, height: 40)
            }
            .padding(.vertical, 40)
            ForEach(Challenge.allCases, id: \.self) { challenge in
                Item(session: $session, challenge: challenge)
            }
            Spacer()
                .frame(height: 20)
        }
    }
}
