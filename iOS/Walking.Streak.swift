import SwiftUI
import Smith

extension Walking {
    struct Streak: View {
        @Binding var session: Session
        @State private var streak = Smith.Streak.zero
        
        var body: some View {
            Text("Streak")
                .font(.headline)
                .padding(.bottom)
            HStack(spacing: 0) {
                Text(NSNumber(value: streak.maximum), formatter: session.decimal)
                    .frame(width: Metrics.streak.walking.width)
                Text(NSNumber(value: streak.current), formatter: session.decimal)
                    .frame(width: Metrics.streak.walking.width)
            }
            .font(Font.title.bold())
            .padding(.bottom, 1)
            .padding(.top)
            HStack(spacing: 0) {
                Text("MAX")
                    .frame(width: Metrics.streak.walking.width)
                Text("CURRENT")
                    .frame(width: Metrics.streak.walking.width)
            }
            .font(.callout)
            .foregroundColor(.secondary)
            .onAppear {
                streak = session.archive.calendar.streak
            }
        }
    }
}
