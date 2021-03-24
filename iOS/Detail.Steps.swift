import SwiftUI
import Smith

extension Detail {
    struct Steps: View {
        @Binding var session: Session
        @State private var steps = Smith.Steps.zero
        @State private var max = 0
        
        var body: some View {
            if session.health.available {
                HStack {
                    Text("Max")
                    Text(NSNumber(value: steps.max), formatter: session.decimal)
                    Spacer()
                }
                .font(Font.body.bold())
                .padding([.horizontal, .top])
                Text("Over the last \(Metrics.chart.vertical) Walks")
                    .font(.callout)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .greatestFiniteMagnitude, alignment: .leading)
                    .padding(.leading)
                Chart(values: steps.values)
                    .frame(height: 260)
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                HStack {
                    Text("All Time Max")
                    Text(NSNumber(value: max), formatter: session.decimal)
                    Spacer()
                }
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding([.horizontal, .bottom])
                .onAppear {
                    steps = session.archive.steps
                    max = session.archive.maxSteps
                }
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
