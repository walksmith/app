import SwiftUI

extension Home {
    struct Greet: View {
        @Binding var session: Session
        
        var body: some View {
            Text(time)
        }
        
        private var time: String {
            switch Calendar.current.component(.hour, from: .init()) {
            case 6 ..< 12:
                return "Good morning"
            case 12:
                return "Good day"
            case 13 ..< 17:
                return "Good afternoon"
            case 17 ..< 22:
                return "Good evening"
            default:
                return "Good night"
            }
        }
    }
}
