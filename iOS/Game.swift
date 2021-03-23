import GameKit
import Combine
import Smith

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
    
    func submit(_ challenge: Challenge, _ value: Int) {
        guard GKLocalPlayer.local.isAuthenticated else { return }
        GKLeaderboard.submitScore(
            value,
            context: 0,
            player: GKLocalPlayer.local,
            leaderboardIDs: [challenge.leaderboard]) { _ in }
    }
}
