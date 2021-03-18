import SwiftUI

extension Walking.Segmented {
    struct Item: View {
        let symbol: String
        let status: Status
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                ZStack {
                    Circle()
                        .fill(status == .selected ? Color.accentColor : .clear)
                    Image(systemName: symbol)
                        .font(.title2)
                        .foregroundColor(status == .selected
                                            ? .white
                                            : status == .on
                                                ? .secondary
                                                : .init(.quaternaryLabel))
                }
                .frame(width: 50, height: 50)
            }
        }
    }
}
