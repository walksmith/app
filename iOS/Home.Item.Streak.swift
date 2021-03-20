import SwiftUI

extension Home.Item {
    struct Streak: View {
        @Binding var session: Session
        @State private var count = ""
        
        var body: some View {
            Text(verbatim: count)
                .font(.callout)
                .fontWeight(.medium)
            Text("Current")
                .font(.caption2)
                .onAppear {
                    count = session.decimal.string(from: NSNumber(value: session.archive.calendar.streak.current))!
                }
        }
    }
}
