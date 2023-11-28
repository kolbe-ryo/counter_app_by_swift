import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            Text("Wallet")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .center)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    ForEach(cards) { card in
                        CardView(card: card)
                    }
                }
            }
        }
        .padding([.horizontal, .top])
    }
    
    @ViewBuilder
    func CardView(card: Card) -> some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottomLeading) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(card.name)
                        .fontWeight(.bold)
                    
                    Text(card.cardNumber)
                        .font(.callout)
                        .fontWeight(.bold)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
            .background(card.cardColor) // カードの背景色を設定
            .cornerRadius(10) // カードの角の半径を設定
            .shadow(radius: 5) // カードに影を追加
        }
        .frame(height: 200)
    }
}

#Preview {
    Home()
}
