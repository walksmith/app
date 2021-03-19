import SwiftUI

extension Listed.Item {
    struct Bar: Shape {
        var percent: CGFloat
        
        func path(in rect: CGRect) -> Path {
            .init {
                $0.move(to: .init(x: 0, y: rect.midY))
                $0.addLine(to: .init(x: rect.width * percent, y: rect.midY))
            }
        }
        
        var animatableData: CGFloat {
            get { percent }
            set { percent = newValue }
        }
    }
}
