import SwiftUI

struct Shadowed: ViewModifier {
    func body(content: Content) -> some View {
        content.shadow(color: Color.primary.opacity(0.4), radius: 4, y: 2)
    }
}
