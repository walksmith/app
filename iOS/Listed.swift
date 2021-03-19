import SwiftUI
import Smith

struct Listed: View {
    @Binding var session: Session
    @State private var items = [Walk.Listed]()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button {
                    withAnimation(.spring(blendDuration: 0.3)) {
                        session.section = .home
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(.secondary)
                        .frame(width: 30, height: 50)
                        .padding(.leading)
                }
                Text("Walks")
                    .font(Font.footnote.bold())
                Spacer()
            }
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(.secondarySystemBackground))
                ScrollView {
                    Spacer()
                        .frame(height: 16)
                    ForEach(0 ..< items.count, id: \.self) {
                        if $0 > 0 {
                            Rectangle()
                                .fill(Color(.tertiarySystemBackground))
                                .frame(height: 1)
                                .padding(.horizontal)
                        }
                        Item(session: $session, item: items[$0])
                    }
                    Spacer()
                        .frame(height: 20)
                }
            }
            .padding([.horizontal, .bottom])
        }
        .onAppear {
            items = session.archive.list
        }
    }
}
