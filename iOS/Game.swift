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
    
    func streak(_ streak: Streak) {
        guard GKLocalPlayer.local.isAuthenticated else { return }
        GKLeaderboard.submitScore(
            streak.current,
            context: 0,
            player: GKLocalPlayer.local,
            leaderboardIDs: [Challenge.streak.leaderboard]) { _ in }
    }
}
