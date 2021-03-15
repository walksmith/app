import SwiftUI

@main struct App: SwiftUI.App {
    @State private var session = Session()
    @Environment(\.scenePhase) private var phase
    private let game = Game()
    
    var body: some Scene {
        WindowGroup {
            Home(session: $session)
                .onReceive(game.name) {
                    session.name = $0
                }
        }
        .onChange(of: phase) {
            if $0 == .active {
                game.login()
            }
        }
    }
}
