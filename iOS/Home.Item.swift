import SwiftUI
import Smith

extension Home {
    struct Item: View {
        @Binding var session: Session
        let challenge: Challenge
        
        var body: some View {
            Button {
                withAnimation(.spring(blendDuration: 0.4)) {
                    session.section = .challenge(challenge)
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(challenge.background)
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(challenge.title)
                                    .font(.callout)
                                    .fontWeight(.heavy)
                                    .fixedSize(horizontal: false, vertical: true)
                                Text(challenge.subtitle)
                                    .font(.caption)
                                    .opacity(0.9)
                            }
                            Spacer()
                            Image(systemName: challenge.symbol)
                                .font(.title)
                        }
                        if session.archive.enrolled(challenge) {
                            Spacer()
                                .frame(height: 20)
                            switch challenge {
                            case .streak:
                                Streak(session: $session)
                            case .steps:
                                Text("")
                            case .distance:
                                Text("")
                            case .map:
                                Text("")
                            }
                        }
                    }
                    .padding()
                    .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
        }
    }
}
