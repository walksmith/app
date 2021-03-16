import GameKit
import Combine

final class Game {
    let name = PassthroughSubject<String, Never>()
    let image = PassthroughSubject<UIImage, Never>()
    
    func login() {
        guard !GKLocalPlayer.local.isAuthenticated else { return }
        GKLocalPlayer.local.authenticateHandler = { [weak self] controller, error in
            guard let controller = controller else {
                if error == nil {
                    self?.name.send(GKLocalPlayer.local.displayName)
                    GKLocalPlayer.local.loadPhoto(for: .normal) { image, _ in
                        image.map {
                            self?.image.send($0)
                        }
                    }
                }
                return
            }
            UIApplication.shared.present(controller)
        }
    }
}
