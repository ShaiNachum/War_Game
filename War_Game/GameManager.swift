import Foundation

class GameManager {
    private let viewController: GameController
    private var dataManager: DataManager
    private var playerLeft: Player
    private var playerRight: Player
    private var isGameOver: Bool
    
    private let numOfRounds: Int = 13
    private var roundNumber: Int
    
    
    init(viewController: GameController, playerLeftName: String, playerRightName: String) {
        self.viewController = viewController
        dataManager = DataManager()
        playerLeft = Player(name:playerLeftName, pack: dataManager.getPack1())
        playerRight = Player(name: playerRightName, pack: dataManager.getPack2())
        isGameOver = false
        roundNumber = 0
    }
  
    public func clockTick() {
        print("round number is: \(roundNumber)")
        updateScore(round: roundNumber)
        updateGameStatus()
        roundNumber += 1
    }
    
    private func updateScore(round: Int) {
        playerLeft.updateScore(score: playerLeft.getCardAtIndex(i: round).getValue())
        playerRight.updateScore(score: playerRight.getCardAtIndex(i: round).getValue())
    }
    
    private func updateGameStatus() {
        if(roundNumber == numOfRounds - 1) {
            self.isGameOver = true
        }
        else{
            self.isGameOver = false
        }
    }
    
    public func getPlayerLeftImage() -> String {
        return playerLeft.getCardAtIndex(i: roundNumber - 1).getName()
    }
    
    public func getPlayerRightImage() -> String {
        return playerRight.getCardAtIndex(i: roundNumber - 1).getName()
    }
    
    public func getPlayerLeftScore() -> Int {
        return playerLeft.getScore()
    }
    
    public func getPlayerRightScore() -> Int {
        return playerRight.getScore()
    }
    
    public func getPlayerLeftName() -> String {
        return playerLeft.getName()
    }
    
    public func getPlayerRightName() -> String {
        return playerRight.getName()
    }
    
    public func getIsGameOver() -> Bool {
        return self.isGameOver
    }
    
}
