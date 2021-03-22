import SwiftUI

extension Ephemeris.Month {
    struct Day: View {
        let index: Int
        
        var body: some View {
            ZStack {
                Text("\(index)")
            }
            .frame(width: 40, height: 40)
        }
    }
}
