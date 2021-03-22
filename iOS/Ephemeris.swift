import SwiftUI
import Smith

struct Ephemeris: View {
    @Binding var session: Session
    @State var month: Int
    let year: Year
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(.secondarySystemBackground))
            VStack(spacing: 0) {
                HStack {
                    Button {
                        month -= 1
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(month == 0 ? .init(.tertiaryLabel) : .primary)
                            .frame(width: 50, height: 50)
                    }
                    .disabled(month == 0)
                    Text(verbatim: session.monther.string(from: Calendar.current.date(from: .init(month: year.months[month].value))!))
                        .font(Font.callout.bold())
                        .frame(width: 130)
                    Button {
                        month += 1
                    } label: {
                        Image(systemName: "chevron.right")
                            .foregroundColor(month == year.months.count - 1 ? .init(.tertiaryLabel) : .primary)
                            .frame(width: 50, height: 50)
                    }
                    .disabled(month == year.months.count - 1)
                }
                HStack(spacing: 0) {
                    ForEach(1 ..< 8) {
                        Text(verbatim: session.weeker.string(from: Calendar.current.date(from: .init(weekday: $0, weekOfMonth: 1))!))
                            .font(.caption2)
                            .foregroundColor(.secondary)
                            .frame(width: Metrics.calendar.day.size)
                    }
                }
                .padding(.vertical)
                ForEach(year.months, id: \.self) {
                    Month(session: $session, month: $0)
                }
            }
            .padding(10)
        }
        .fixedSize()
    }
}
