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
            if calendar.isEmpty {
                Image(systemName: "figure.walk")
                    .font(.largeTitle)
                    .padding(.top, 150)
                Text("Ready for your first walk")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
            } else {
                Ephemeris(session: $session, year: calendar.count - 1, month: calendar.last!.months.count - 1, years: calendar)
                    .padding()
            }
        }
    }
}
