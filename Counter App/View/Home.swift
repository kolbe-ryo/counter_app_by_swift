import SwiftUI

struct Home: View {
    @State var expandCards: Bool = false
    @State var currentCard: Card?
    @State var showDetailCard: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Wallet")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .frame(
                    maxWidth: .infinity,
                    alignment: expandCards ? .leading: .center
                )
                .overlay(
                    alignment: .trailing,
                    content: {
                        // MARK: Close Button
                        Button {
                            withAnimation(
                                .interactiveSpring(
                                    response: 0.8,
                                    dampingFraction: 0.7,
                                    blendDuration: 0.7
                                )
                            ) {
                                expandCards = false
                            }
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .padding(10)
                                .background(.blue, in: Circle())
                        }
                        .rotationEffect(
                            .init(
                                degrees: expandCards ? 45 : 0
                            )
                        )
                        .offset(x: expandCards ? 0 : 15)
                        .opacity(expandCards ? 1 : 0)
                    }
                )
                .padding(.horizontal, 15)
                .padding(.bottom, 10)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    ForEach(cards) { card in
                        CardView(card: card)
                    }
                }
                .overlay {
                    Rectangle()
                        .fill(.black.opacity(expandCards ? 0 : 0.01))
                        .onTapGesture {
                            withAnimation(
                                .easeInOut(duration: 0.35)
                            ) {
                                expandCards = true
                            }
                        }
                }
                .padding(.top, expandCards ? 30 : 0)
            }
            .coordinateSpace(name: "SCROLL")
            .offset(y: expandCards ? 0 : 30)
            
            Button {
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .padding(20)
                    .background(.blue, in: Circle())
            }
            .rotationEffect(
                .init(
                    degrees: expandCards ? 180 : 0
                )
            )
            .scaleEffect(expandCards ? 0.01 : 1)
            .opacity(!expandCards ? 1 : 0)
            .frame(height: expandCards ? 0 : nil)
            .padding(.bottom, expandCards ? 0 : 30)
        }
        .padding([.horizontal, .top])
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay {
            if let currentCard = currentCard, showDetailCard {
                DetailView(
                    currentCard: currentCard,
                    showDetailCard: $showDetailCard
                )
            }
        }
    }
    
    @ViewBuilder
    func CardView(card: Card) -> some View {
        GeometryReader { proxy in
            
            let rect = proxy.frame(in: .named("SCROLL"))
            
            let offset = CGFloat(getExpandRect(Card: card))
            
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
            .offset(y: expandCards ? offset : offset - rect.minY)
        }
        .frame(height: 220)
    }
    
    func getExpandRect(Card: Card) -> Int{
        let index = cards.firstIndex{ currentCard in
            return currentCard.id == Card.id
        } ?? 0
        return index * (expandCards ? 10 : 70)
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

struct DetailView: View {
    var currentCard: Card
    @Binding var showDetailCard: Bool
    var body: some View {
        VStack {
            
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .top
        )
    }
    
    @ViewBuilder
    func CardView() -> some View {
        ZStack(alignment: .leading) {
            // カード背景
            RoundedRectangle(cornerRadius: 10)
                .fill(currentCard.cardColor)
            
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
                
                Text(customisedCardNumber(number:currentCard.cardNumber))
                    .fontWeight(.bold)
                
                Text(currentCard.name)
                    .font(.callout)
                    .fontWeight(.bold)
            }
            .padding([.leading, .bottom])
            .foregroundColor(.white)
        }
    }
}
