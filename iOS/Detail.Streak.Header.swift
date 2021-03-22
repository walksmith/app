import SwiftUI
import Smith

extension Detail.Streak {
    struct Header: View {
        @Binding var session: Session
        let streak: Streak
        
        var body: some View {
            HStack(alignment: .bottom) {
                Text(verbatim: session.decimal.string(from: NSNumber(value: streak.maximum))!)
                    .frame(width: Metrics.streak.header.width)
                Text(verbatim: session.decimal.string(from: NSNumber(value: streak.current))!)
                    .frame(width: Metrics.streak.header.width)
                Image(systemName: today ? "checkmark.circle.fill" : "slash.circle")
                    .font(.largeTitle)
                    .foregroundColor(today ? .primary : .secondary)
                    .frame(width: Metrics.streak.header.width)
            }
            .padding(.top, 10)
            .padding(.bottom, 1)
            HStack {
                Text("MAX")
                    .frame(width: Metrics.streak.header.width)
                Text("CURRENT")
                    .frame(width: Metrics.streak.header.width)
                Text("TODAY")
                    .frame(width: Metrics.streak.header.width)
            }
            .font(.footnote)
            .foregroundColor(.secondary)
            .padding(.bottom, 10)
        }
        
        private var today: Bool {
            session.archive.last != nil && Calendar.current.isDate(session.archive.last!.start, inSameDayAs: .init())
        }
    }
}
