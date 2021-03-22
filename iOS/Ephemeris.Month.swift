import SwiftUI
import Smith

extension Ephemeris {
    struct Month: View {
        @Binding var session: Session
        let month: Year.Month
        
        var body: some View {
            ForEach(month.days, id: \.self) { week in
                HStack(spacing: 0) {
                    ForEach(week, id: \.self) {
                        Day(index: $0.value)
                    }
                }
                .padding(.leading, leading(week))
                .padding(.trailing, trailing(week))
            }
        }
        
        private func leading(_ week: [Year.Month.Day]) -> CGFloat {
            .init(Calendar.current.component(
                    .weekday,
                    from: Calendar.current.date(
                        from: .init(year: 2021, month: month.value, day: week.first!.value))!) - 1) * Metrics.calendar.day.size
        }
        
        private func trailing(_ week: [Year.Month.Day]) -> CGFloat {
            .init(7 - Calendar.current.component(
                    .weekday,
                    from: Calendar.current.date(
                        from: .init(year: 2021, month: month.value, day: week.last!.value))!)) * Metrics.calendar.day.size
        }
    }
}
