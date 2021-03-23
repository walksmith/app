import SwiftUI
import Combine
import Smith

extension Walking {
    struct Steps: View {
        @Binding var session: Session
        @State private var count = 0
        
        var body: some View {
            Text("Steps")
                .font(.headline)
                .padding(.bottom)
            Text(NSNumber(value: count), formatter: session.decimal)
                .font(Font.title.bold())
                .padding(.top)
            .onAppear {
                var sub: AnyCancellable?
                sub = session.health.query(session.archive, .steps).receive(on: DispatchQueue.main).sink {
                    count = $0
                    sub?.cancel()
                }
            }
        }
    }
}
