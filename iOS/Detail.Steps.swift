import SwiftUI

extension Detail {
    struct Steps: View {
        @Binding var session: Session
        @State private var count = 0
        
        var body: some View {
            if session.health.available {
                Image(systemName: "speedometer")
                    .font(.largeTitle)
                    .padding(.top, 50)
                    .padding(.bottom)
                Text(NSNumber(value: count), formatter: session.decimal)
                    .font(Font.largeTitle.bold())
                    .padding(.top)
                Text("MAX")
                    .font(.callout)
                    .foregroundColor(.secondary)
                    .padding(.bottom)
                    .onAppear {
                        count = session.archive.steps
                        session.health.request(.steps)
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
