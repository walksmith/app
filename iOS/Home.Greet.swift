import SwiftUI

extension Home {
    struct Greet: View {
        @Binding var session: Session
        
        var body: some View {
            ZStack {
                Circle()
                    .fill(LinearGradient(
                            gradient: .init(colors: [.pink, .init(.systemIndigo)]),
                            startPoint: .topLeading,
                            endPoint: .bottom))
                    .frame(width: 100, height: 100)
                if session.player.image == nil {
                    Image(systemName: "person.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                } else {
                    Image(uiImage: session.player.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                }
            }
            .padding(.top, 40)
            Text(verbatim: session.player.name)
                .font(Font.title2)
                .fontWeight(.medium)
                .padding()
                .id(session.player.name)
        }
    }
}
