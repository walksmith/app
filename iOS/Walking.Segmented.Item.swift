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
                        .foregroundColor(status == .selected
                                            ? .white
                                            : status == .on
                                                ? .secondary
                                                : .init(.tertiaryLabel))
                        .font(.title2)
                        .padding(10)
                }
                .fixedSize()
            }
        }
    }
}
