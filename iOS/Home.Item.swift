import SwiftUI

extension Home {
    struct Item: View {
        @Binding var session: Session
        let challenge: Challenge
        
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(challenge.background)
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(challenge.title)
                                .fontWeight(.heavy)
                            Text(challenge.subtitle)
                                .font(.footnote)
                                .opacity(0.8)
                        }
                        Spacer()
                        Image(systemName: challenge.symbol)
                            .font(.title)
                    }
                    Text("Join now")
                        .padding(.top)
                }
                .padding()
                .foregroundColor(.white)
            }
            .padding(.horizontal)
        }
    }
}
