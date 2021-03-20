import SwiftUI
import Smith

extension Detail {
    struct Streak: View {
        @Binding var session: Session
        @State private var calendar = [Year]()
        @State private var streak = Smith.Streak.zero
        
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(.secondarySystemBackground))
                VStack {
                    Header(session: $session, streak: streak)
                }
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
