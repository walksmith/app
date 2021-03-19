import SwiftUI
import Smith

extension Listed {
    struct Item: View {
        @Binding var session: Session
        let item: Walk.Listed
        @State private var date = " "
        @State private var duration = " "
        @State private var percent = CGFloat()
        
        var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text(verbatim: date)
                    Text(verbatim: duration)
                        .foregroundColor(.secondary)
                }
                .font(.footnote)
                Spacer()
                ZStack(alignment: .leading) {
                    Bar(percent: 1)
                        .stroke(Color(.tertiarySystemBackground), style: .init(lineWidth: 8, lineCap: .round))
                    Bar(percent: percent)
                        .stroke(Color.accentColor, style: .init(lineWidth: 8, lineCap: .round))
                }
                .frame(width: 100)
            }
            .padding(.horizontal)
            .onAppear {
                date = session.relative.string(from: item.date, to: .init())
                duration = session.components.string(from: item.duration) ?? ""
                withAnimation(.easeInOut(duration: 1)) {
                    percent = .init(item.percent)
                }
            }
        }
    }
}
