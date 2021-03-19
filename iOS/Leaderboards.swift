import SwiftUI
import Smith

struct Leaderboards: UIViewControllerRepresentable {
    @Binding var session: Session
    let challenge: Challenge
    
    func makeCoordinator() -> Coordinator {
        .init(wrapper: self)
    }
    
    func makeUIViewController(context: Context) -> Coordinator {
        context.coordinator
    }
    
    func updateUIViewController(_ uiViewController: Coordinator, context: Context) { }
}
