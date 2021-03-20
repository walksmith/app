import SwiftUI
import Smith

extension Detail.Streak {
    struct Header: View {
        @Binding var session: Session
        let streak: Streak
        
        var body: some View {
            HStack {
                VStack {
                    Text(verbatim: session.decimal.string(from: NSNumber(value: streak.maximum))!)
                    Text("Max")
                }
                VStack {
                    Text(verbatim: session.decimal.string(from: NSNumber(value: streak.current))!)
                    Text("Current")
                }
            }
        }
    }
}
