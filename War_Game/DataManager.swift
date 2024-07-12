import Foundation


class DataManager {
    private var cards: [Card]
    private var pack1: [Card]
    private var pack2: [Card]
    private let sizeOfPack = 13
    
    init() {
        self.cards = []
        cards.append(Card(name: "1_of_hearts", value: 11))
        cards.append(Card(name: "2_of_hearts", value: 12))
        cards.append(Card(name: "3_of_hearts", value: 13))
        cards.append(Card(name: "4_of_hearts", value: 14))
        cards.append(Card(name: "5_of_hearts", value: 15))
        cards.append(Card(name: "6_of_hearts", value: 16))
        cards.append(Card(name: "7_of_hearts", value: 17))
        cards.append(Card(name: "8_of_hearts", value: 18))
        cards.append(Card(name: "9_of_hearts", value: 19))
        cards.append(Card(name: "10_of_hearts", value: 20))
        cards.append(Card(name: "11_of_hearts", value: 21))
        cards.append(Card(name: "12_of_hearts", value: 22))
        cards.append(Card(name: "13_of_hearts", value: 23))
        
        cards.append(Card(name: "1_of_spades", value: 1))
        cards.append(Card(name: "2_of_spades", value: 2))
        cards.append(Card(name: "3_of_spades", value: 3))
        cards.append(Card(name: "4_of_spades", value: 4))
        cards.append(Card(name: "5_of_spades", value: 5))
        cards.append(Card(name: "6_of_spades", value: 6))
        cards.append(Card(name: "7_of_spades", value: 7))
        cards.append(Card(name: "8_of_spades", value: 8))
        cards.append(Card(name: "9_of_spades", value: 9))
        cards.append(Card(name: "10_of_spades", value: 10))
        cards.append(Card(name: "11_of_spades", value: 11))
        cards.append(Card(name: "12_of_spades", value: 12))
        cards.append(Card(name: "13_of_spades", value: 13))
        
        self.cards = cards.shuffled()
        
        self.pack1 = []
        self.pack2 = []
        
        for i in 0..<sizeOfPack {
            pack1.append(cards[i])
        }
        
        for i in sizeOfPack..<cards.count {
            pack2.append(cards[i])
        }
    }
    
    public func getPack1() -> [Card] {
        return pack1
    }
    
    public func getPack2() -> [Card] {
        return pack2
    }

}

