import SwiftUI

@main struct App: SwiftUI.App {
    @State private var session = Session()
    @Environment(\.scenePhase) private var phase
    private let game = Game()
    
    var body: some Scene {
        WindowGroup {
            Home(session: $session)
                .onReceive(game.name) { name in
                    withAnimation(.easeInOut(duration: 0.3)) {
                        session.name = name
                    }
                }
                .onReceive(game.image) { image in
                    withAnimation(.easeInOut(duration: 0.3)) {
                        session.image = image
                    }
                }
        }
        .onChange(of: phase) {
            if $0 == .active {
                game.login()
            }
        }
    }
}
