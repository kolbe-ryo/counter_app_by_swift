
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
    Card(name: "Ryo", cardNumber: "21234567890", cardColor: Color.blue, cardImage: "amex"),
    Card(name: "Kolbe", cardNumber: "21234567890", cardColor: Color.green,cardImage: "amex"),
    Card(name: "Fukahori", cardNumber: "21234567890", cardColor: Color.red,cardImage: "amex")
]
