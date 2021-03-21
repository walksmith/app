import SwiftUI
import Smith

extension Detail {
    struct Streak: View {
        @Binding var session: Session
        @State private var calendar = [Year]()
        @State private var streak = Smith.Streak.zero
        
        var body: some View {
            Header(session: $session, streak: streak)
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(.secondarySystemBackground))
                Ephemeris(session: $session, calendar: calendar)
                    .padding()
            }
            .padding(.horizontal)
            .onAppear {
                calendar = session.archive.calendar
                streak = calendar.streak
            }
        }
    }
}
