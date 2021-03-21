import SwiftUI
import Smith

struct Ephemeris: View {
    @Binding var session: Session
    
    @State var year: Int {
        willSet {
            month = month < years[newValue].months.count ? month : years[newValue].months.count - 1
        }
    }
    
    @State var month: Int
    
    let years: [Year]
    
    var body: some View {
        VStack {
            Picker("", selection: $year) {
                ForEach(0 ..< years.count) {
                    Text(verbatim: "\(years[$0].value)")
                        .tag($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .labelsHidden()
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(.secondarySystemBackground))
                TabView(selection: $month) {
                    ForEach((0 ..< years[year].months.count), id: \.self) {
                        Month(session: $session, month: years[year].months[$0])
                            .font(.callout)
                            .tag($0)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
            }
        }
    }
}
