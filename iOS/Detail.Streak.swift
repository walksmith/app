import SwiftUI
import Smith

extension Detail {
    struct Streak: View {
        @Binding var session: Session
        let calendar: [Year]
        let streak: Smith.Streak
        
        var body: some View {
            Header(session: $session, streak: streak)
            Spacer()
            if let year = calendar.last {
                Ephemeris(session: $session, index: year.months.count - 1, year: year)
            } else {
                Image(systemName: "figure.walk")
                    .font(.largeTitle)
            }
        }
    }
}
