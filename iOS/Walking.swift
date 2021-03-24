import SwiftUI
import Smith

struct Walking: View {
    @Binding var session: Session
    @State private var challenge: Challenge?
    @State private var disabled = false
    @State private var steps = 0
    
    var body: some View {
        VStack {
            Segmented(session: $session, challenge: $challenge)
                .padding(.bottom)
            
            switch challenge {
            case .streak:
                Streak(session: $session)
            case .steps:
                Steps(session: $session, steps: $steps)
            default:
                Time(session: $session)
            }
            
            Button {
                disabled = true
                session.archive.end(steps: steps)
                DispatchQueue.global(qos: .utility).async {
                    if session.archive.enrolled(.streak) {
                        session.game.submit(.streak, session.archive.calendar.streak.current)
                    }
                    if session.archive.enrolled(.steps) {
                        session.game.submit(.steps, steps)
                    }
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
            .padding(.top)
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
            .onReceive(session.health.steps.receive(on: DispatchQueue.main)) {
                steps = $0
            }
            .onAppear {
                session.health.steps(session.archive)
                session.pedometer.steps(session.archive)
            }
            .onDisappear(perform: session.health.clear)
        }
    }
}
