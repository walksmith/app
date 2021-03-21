import SwiftUI
import Smith

extension Ephemeris {
    struct Month: View {
        @Binding var session: Session
        let month: Year.Month
        
        var body: some View {
            GeometryReader { proxy in
                VStack {
                    Text(verbatim: session.monther.string(from: Calendar.current.date(from: .init(month: month.value))!))
                }
            }
            .padding()
        }
    }
}
