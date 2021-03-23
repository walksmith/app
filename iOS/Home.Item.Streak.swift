import SwiftUI

extension Home.Item {
    struct Streak: View {
        @Binding var session: Session
        
        var body: some View {
            HStack {
                Text("Today")
                    .font(.footnote)
                Image(systemName: today ? "checkmark.circle.fill" : "slash.circle")
                    .font(.title3)
            }
            .foregroundColor(today ? .white : .init(white: 1, opacity: 0.4))
        }
        
        private var today: Bool {
            session.archive.last != nil && Calendar.current.isDate(session.archive.last!.start, inSameDayAs: .init())
        }
    }
}
