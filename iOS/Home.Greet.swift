import SwiftUI

extension Home {
    struct Greet: View {
        @Binding var session: Session
        
        var body: some View {
            ZStack {
                Circle()
                    .fill(LinearGradient(
                            gradient: .init(colors: [.blue, .init(.systemIndigo)]),
                            startPoint: .top,
                            endPoint: .bottom))
                    .frame(width: 100, height: 100)
                if session.image == nil {
                    Image(systemName: "figure.walk")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                } else {
                    Image(uiImage: session.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                }
            }
            .padding(.top, 40)
            Text(verbatim: session.name)
                .font(Font.title2)
                .fontWeight(.medium)
                .padding()
                .id(session.name)
        }
    }
}
