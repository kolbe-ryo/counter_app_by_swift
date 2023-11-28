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
            ZStack(alignment: .leading) {
                // カード背景
                RoundedRectangle(cornerRadius: 10)
                    .fill(card.cardColor)
                
                VStack(alignment: .leading, spacing: 10) {
                    // ロゴ（右上に配置）
                    HStack {
                        Spacer()
                        Image("amex")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .padding()
                    }
                    
                    Spacer()
                    
                    Text(card.cardNumber)
                        .fontWeight(.bold)
                    
                    Text(card.name)
                        .font(.callout)
                        .fontWeight(.bold)
                }
                .padding([.leading, .bottom])
                .foregroundColor(.white)
            }
            .padding()
        }
        .frame(height: 200)
    }
}

#Preview {
    Home()
}
