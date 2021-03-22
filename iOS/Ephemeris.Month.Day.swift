import SwiftUI

extension Ephemeris.Month {
    struct Day: View {
        let index: Int
        
        var body: some View {
            ZStack {
                Text("\(index)")
            }
            .frame(width: Metrics.calendar.day.size, height: Metrics.calendar.day.size)
        }
    }
}
