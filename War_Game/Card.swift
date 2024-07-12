import Foundation

class Card {
    private var name: String
    private var value: Int
    
    
    init(name: String, value: Int){
        self.name = name
        self.value = value
    }
    
    public func getName() -> String {
        return self.name
    }
    
    public func getValue() -> Int {
        return self.value
    }

    
}
