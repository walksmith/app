import SwiftUI

extension Walking {
    struct Counter: View {
        @Binding var session: Session
        @State private var counter = ""
        @State private var formatter = DateComponentsFormatter()
        private let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
        
        var body: some View {
            ZStack {
                Capsule()
                    .fill(Color(.systemIndigo))
                Text(verbatim: counter)
                    .font(Font.title2.monospacedDigit())
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .padding()
            }
            .fixedSize()
            .onAppear {
                formatter.allowedUnits = [.hour, .minute, .second]
                formatter.unitsStyle = .positional
                formatter.zeroFormattingBehavior = .pad
            }
            .onReceive(timer) { _ in
                if case let .walking(duration) = session.archive.status {
                    counter = formatter.string(from: duration) ?? ""
                }
            }
        }
    }
}
