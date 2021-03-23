import SwiftUI

extension Home.Item {
    struct Steps: View {
        @Binding var session: Session
        @State private var count = 0
        
        var body: some View {
            HStack {
                Text("Max")
                    .font(.footnote)
                Text(NSNumber(value: count), formatter: session.decimal)
                    .font(Font.title3.bold())
            }
            .onAppear {
                count = session.archive.steps
            }
        }
    }
}
