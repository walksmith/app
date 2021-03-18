import SwiftUI

extension Walking {
    struct Counter: View {
        @Binding var session: Session
        @State private var counter = ""
        @State private var formatter = DateComponentsFormatter()
        private let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
        
        var body: some View {
            Text(verbatim: counter)
                .font(Font.callout.bold().monospacedDigit())
                .foregroundColor(.secondary)
                .onAppear {
                    formatter.allowedUnits = [.hour, .minute, .second]
                    formatter.unitsStyle = .positional
                    formatter.zeroFormattingBehavior = .dropLeading
                }
                .onReceive(timer) { _ in
                    if case let .walking(duration) = session.archive.status {
                        counter = formatter.string(from: duration) ?? ""
                    }
                }
        }
    }
}
