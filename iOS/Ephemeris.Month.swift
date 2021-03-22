import SwiftUI
import Smith

extension Ephemeris {
    struct Month: View {
        @Binding var session: Session
        let month: Year.Month
        
        var body: some View {
            ForEach(month.days, id: \.self) { week in
                HStack(spacing: 0) {
                    ForEach(0 ..< 7, id: \.self) {
                        Day(index: $0)
                    }
                }
            }
        }
    }
}
