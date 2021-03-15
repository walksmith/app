import SwiftUI

extension Home {
    struct Greet: View {
        @Binding var session: Session
        
        var body: some View {
            Image(systemName: "figure.walk.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 80)
                .foregroundColor(.blue)
                .padding(.top)
            Text(verbatim: session.name)
                .font(Font.title)
                .fontWeight(.medium)
                .padding(.horizontal)
            Text(time)
                .foregroundColor(.secondary)
                .font(.footnote)
                .padding(.horizontal)
        }
        
        private var time: String {
            switch Calendar.current.component(.hour, from: .init()) {
            case 6 ..< 12:
                return "Good Morning"
            case 12:
                return "Good Day"
            case 13 ..< 17:
                return "Good Afternoon"
            case 17 ..< 22:
                return "Good Evening"
            default:
                return "Good Night"
            }
        }
    }
}
