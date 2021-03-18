import SwiftUI
import Smith

extension Walking {
    struct Segmented: View {
        @Binding var session: Session
        @Binding var challenge: Challenge?
        
        var body: some View {
            HStack {
                Item(symbol: "timelapse", status: challenge == nil ? .selected : .on) {
                    challenge = nil
                }
                Item(symbol: "calendar", status: challenge == .streak ? .selected : session.archive.enrolled(.streak) ? .on : .off) {
                    guard session.archive.enrolled(.streak) else { return }
                    challenge = .streak
                }
                Item(symbol: "speedometer", status: challenge == .steps ? .selected : session.archive.enrolled(.steps) ? .on : .off) {
                    guard session.archive.enrolled(.steps) else { return }
                    challenge = .steps
                }
                Item(symbol: "point.topleft.down.curvedto.point.bottomright.up", status: challenge == .distance ? .selected : session.archive.enrolled(.distance) ? .on : .off) {
                    guard session.archive.enrolled(.distance) else { return }
                    challenge = .distance
                }
                Item(symbol: "map.fill", status: challenge == .map ? .selected : session.archive.enrolled(.map) ? .on : .off) {
                    guard session.archive.enrolled(.map) else { return }
                    challenge = .map
                }
            }
            .padding(.top)
        }
    }
}
