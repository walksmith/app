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
            HStack {
                Spacer()
                Text(NSNumber(value: streak.maximum), formatter: session.decimal)
                    .font(Font.title.bold())
                Text("/")
                    .font(.title2)
                    .foregroundColor(.secondary)
                Text(NSNumber(value: streak.current), formatter: session.decimal)
                    .font(.title2)
                    .foregroundColor(.secondary)
            }
            .frame(width: 250)
            ZStack {
                Bar(percent: 1)
                    .stroke(Color(.secondarySystemBackground), style: .init(lineWidth: 8, lineCap: .round))
                Bar(percent: streak.maximum == 0 ? 0 : .init(streak.current) / .init(streak.maximum))
                    .stroke(LinearGradient(
                                gradient: .init(colors: [.blue, .init(.systemIndigo)]),
                                startPoint: .leading,
                                endPoint: .trailing), style: .init(lineWidth: 8, lineCap: .round))
            }
            .frame(width: 250, height: 10)
            .onAppear {
                streak = session.archive.calendar.streak
            }
        }
    }
}
