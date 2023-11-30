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
                
                VStack(alignment: .leading, spacing: 0) {
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
                    
                    Text(customisedCardNumber(number:card.cardNumber))
                        .fontWeight(.bold)
                    
                    Text(card.name)
                        .font(.callout)
                        .fontWeight(.bold)
                }
                .padding([.leading, .bottom])
                .foregroundColor(.white)
            }
        }
        .frame(height: 220)
    }
    
    func customisedCardNumber(number: String) -> String {
        var customisedValue: String = ""
        let unCealCount: Int = number.count - 4
        
        number.enumerated().forEach { value in
            if value.offset >= unCealCount {
                customisedValue.append(contentsOf: String(value.element))
            } else {
                if String(value.element) == " " {
                    customisedValue.append(contentsOf: " ")
                } else {
                    customisedValue.append(contentsOf: "*")
                }
            }
        }
        return customisedValue
    }
}

#Preview {
    Home()
}
