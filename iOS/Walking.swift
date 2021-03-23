import SwiftUI
import Combine
import Smith

struct Walking: View {
    @Binding var session: Session
    @State private var challenge: Challenge?
    @State private var disabled = false
    
    var body: some View {
        VStack {
            Segmented(session: $session, challenge: $challenge)
            Spacer()
            
            switch challenge {
            case .streak:
                Streak(session: $session)
            case .steps:
                Steps(session: $session)
            default:
                Time(session: $session)
            }
            
            Spacer()
            Button {
                disabled = true
                var sub: AnyCancellable?
                sub = session.health.query(session.archive, .steps).receive(on: DispatchQueue.main).sink { steps in
                    withAnimation(.spring(blendDuration: 0.3)) {
                        session.archive.end(steps: steps)
                        DispatchQueue.global(qos: .utility).async {
                            if session.archive.enrolled(.streak) {
                                session.game.submit(.streak, session.archive.calendar.streak.current)
                            }
                            if session.archive.enrolled(.steps) {
                                session.game.submit(.steps, steps)
                            }
                        }
                    }
                    sub?.cancel()
                }
            } label: {
                ZStack {
                    Capsule()
                        .fill(LinearGradient(
                                gradient: .init(colors: [.init(.systemIndigo), .blue]),
                                startPoint: .leading,
                                endPoint: .trailing))
                        .modifier(Shadowed())
                    Text("FINISH")
                        .foregroundColor(.white)
                        .font(Font.callout)
                        .fontWeight(.medium)
                        .padding(.horizontal, 64)
                        .padding(.vertical, 10)
                }
                .fixedSize()
            }
            .disabled(disabled)
            Button {
                withAnimation(.spring(blendDuration: 0.3)) {
                    session.archive.cancel()
                }
            } label: {
                Text("CANCEL")
                    .foregroundColor(.secondary)
                    .font(.caption)
                    .frame(width: 300, height: 34)
            }
            .disabled(disabled)
            .padding(.top, 10)
            .padding(.bottom)
        }
    }
}
