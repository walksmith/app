import SwiftUI

extension Detail {
    struct Steps: View {
        @Binding var session: Session
        @State private var values = [Double]()
        @State private var count = 0
        
        var body: some View {
            if session.health.available {
                HStack {
                    Text("Max")
                    Text(NSNumber(value: values.max() ?? 0), formatter: session.decimal)
                    Spacer()
                }
                .font(Font.body.bold())
                .padding([.horizontal, .top])
                Text("Over the last \(Metrics.chart.vertical) walks")
                    .font(.callout)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .greatestFiniteMagnitude, alignment: .leading)
                    .padding(.leading)
                Chart(values: [0.3, 0.4, 0.5, 0.4, 0.6, 0.7, 0.8, 0.9, 0.2, 0.3, 0.4, 0.4, 0.5, 0.4, 0.3, 0.32, 0.31, 0.33, 0.35, 0.34])
                    .frame(height: 260)
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                HStack {
                    Text("All Time Max")
                    Text(NSNumber(value: count), formatter: session.decimal)
                    Spacer()
                }
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding([.horizontal, .bottom])
            } else {
                Image(systemName: "speedometer")
                    .font(.largeTitle)
                    .foregroundColor(.secondary)
                    .padding(.top, 100)
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.pink)
                    .padding(.vertical)
                Text("Apple Health not available")
                Text("Apple Health app is necessary\nto access your step count.")
                    .multilineTextAlignment(.center)
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
        }
    }
}
