
import SwiftUI
import Foundation

struct Card: Identifiable {
    var id = UUID().uuidString
    var name: String
    var cardNumber: String
    var cardColor: Color
    var cardImage: String
    
    
}

var cards: [Card] = [
    Card(name: "Ryo", cardNumber: "2121 3456 7890 0000", cardColor: Color.blue, cardImage: "amex"),
    Card(name: "Kolbe", cardNumber: "2121 3456 7890 0000", cardColor: Color.green,cardImage: "amex"),
    Card(name: "Fukahori", cardNumber: "2121 3456 7890 0000", cardColor: Color.red,cardImage: "amex")
]
