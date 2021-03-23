import SwiftUI

extension Home.Item {
    struct Steps: View {
        @Binding var session: Session
        @State private var count = 0
        
        var body: some View {
            HStack {
                Text(NSNumber(value: count), formatter: session.decimal)
                Image(systemName: "speedometer")
                    .font(.title3)
            }
            .onAppear {
                count = session.archive.steps
            }
        }
    }
}
