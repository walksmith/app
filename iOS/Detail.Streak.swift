import SwiftUI
import Smith

extension Detail {
    struct Streak: View {
        @Binding var session: Session
        @State private var calendar = [Year]()
        @State private var streak = Smith.Streak.zero
        
        var body: some View {
            Header(session: $session, streak: streak)
                .onAppear {
                    calendar = session.archive.calendar
                    streak = calendar.streak
                }
            if let year = calendar.last {
                Ephemeris(session: $session, month: year.months.count - 1, year: year)
                    .padding()
            } else {
                Image(systemName: "figure.walk")
                    .font(.largeTitle)
                    .padding(.top, 150)
            }
        }
    }
}
