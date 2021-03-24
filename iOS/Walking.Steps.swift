import SwiftUI
import Combine

extension Walking {
    struct Steps: View {
        @Binding var session: Session
        @State private var max = 0
        @State private var count = 0
        
        var body: some View {
            Text("Steps")
                .font(.headline)
            ZStack {
                Ring(percent: 1)
                    .stroke(Color.blue.opacity(0.2), lineWidth: 25)
                Ring(percent: max == 0 ? 0 : .init(count) / .init(max))
                    .stroke(LinearGradient(
                                gradient: .init(colors: [.purple, .init(.systemIndigo)]),
                                startPoint: .top,
                                endPoint: .bottom),
                            style: .init(lineWidth: 25,
                                         lineCap: .round))
                VStack {
                    Text(NSNumber(value: count), formatter: session.decimal)
                        .font(Font.largeTitle.bold())
                        .padding(.horizontal)
                    if max > 0 {
                        Text(NSNumber(value: max), formatter: session.decimal)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .frame(maxWidth: 250, maxHeight: 250)
            .padding()
            .onAppear {
                max = session.archive.maxSteps
                
                var sub: AnyCancellable?
                sub = session.health.query(session.archive, .steps).receive(on: DispatchQueue.main).sink {
                    count = $0
                    sub?.cancel()
                }
            }
        }
    }
}
