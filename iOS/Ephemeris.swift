import SwiftUI
import Smith

struct Ephemeris: View {
    @Binding var session: Session
    @State var month: Int
    let year: Year
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(.secondarySystemBackground))
                TabView(selection: $month) {
                    ForEach(0 ..< year.months.count, id: \.self) {
                        Month(session: $session, month: year.months[$0])
                            .font(.callout)
                            .tag($0)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
            }
        }
    }
}
