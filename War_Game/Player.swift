import Foundation

class Player {
    private var name: String
    private var pack: [Card]
    private var score: Int
    //private var lat: Double
    //private var lon: Double
    
    
    init(name: String, pack: [Card]) {
        self.name = name
        self.pack = pack
        self.score = 0
    }
    
    public func getName() -> String {
        return self.name
    }
    
    public func setName(name: String) {
        self.name = name
    }
    
    public func getScore() -> Int {
        return self.score
    }
    
    public func updateScore(score: Int) {
        self.score += score
    }
    
    public func getPack() -> [Card] {
        return self.pack
    }
    
    public func setPack(pack: [Card]) {
        self.pack = pack
    }
    
    public func getCardAtIndex(i: Int) -> Card {
        return pack[i]
    }
}
