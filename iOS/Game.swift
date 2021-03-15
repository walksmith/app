import GameKit
import Combine

final class Game {
    let name = PassthroughSubject<String, Never>()
    let photo = PassthroughSubject<UIImage, Never>()
    
    func login() {
        guard !GKLocalPlayer.local.isAuthenticated else { return }
        GKLocalPlayer.local.authenticateHandler = { [weak self] controller, error in
            guard let controller = controller else {
                if error == nil {
                    self?.name.send(GKLocalPlayer.local.displayName)
                }
                return
            }
            UIApplication.shared.present(controller)
        }
    }
}
