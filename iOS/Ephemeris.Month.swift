import SwiftUI
import Smith

extension Ephemeris {
    struct Month: View {
        @Binding var session: Session
        let month: Year.Month
        
        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                Text(verbatim: session.monther.string(from: Calendar.current.date(from: .init(month: month.value))!))
                    .font(Font.callout.bold())
                ForEach(month.days, id: \.self) { week in
                    HStack(spacing: 0) {
                        ForEach(0 ..< 7, id: \.self) {
                            Day(index: $0)
                        }
                    }
                }
            }
            .padding()
        }
    }
}
