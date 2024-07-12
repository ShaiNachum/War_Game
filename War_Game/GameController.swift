import UIKit

class GameController: UIViewController {
    
    @IBOutlet weak var game_LBL_titleLeft: UILabel!
    @IBOutlet weak var game_LBL_titleRight: UILabel!
    
    @IBOutlet weak var game_IMG_playerLeft: UIImageView!
    @IBOutlet weak var game_IMG_playerRight: UIImageView!
    
    @IBOutlet weak var game_LBL_scoreLeft: UILabel!
    @IBOutlet weak var game_LBL_scoreRight: UILabel!
    
    @IBOutlet weak var game_BTN_pause_resume: UIButton!
    
    var timer: Timer = Timer()
    var counter: Int = 0
    var timerCounting: Bool = false
    var gameManager: GameManager!
    var playerName: String = ""
    var phoneName: String = "phone"
    var side: Bool = false; //False = Left  ; True = Right

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(side == false){
            gameManager = GameManager(viewController: self , playerLeftName: playerName, playerRightName: phoneName)
            game_LBL_titleLeft.text = playerName
            game_LBL_titleRight.text = phoneName
        }
        else{
            gameManager = GameManager(viewController: self , playerLeftName: phoneName, playerRightName: playerName)
            game_LBL_titleLeft.text = phoneName
            game_LBL_titleRight.text = playerName
        }

        game_BTN_pause_resume.setTitle("START", for: .normal)
        game_BTN_pause_resume.setTitleColor(UIColor.black, for: .normal)
        
    }
    
    @IBAction func pauseResumeClicked(_ sender: Any) {
        if(timerCounting){
            timerCounting = false
            timer.invalidate()
            game_BTN_pause_resume.setTitle("START", for: .normal)
            game_BTN_pause_resume.setTitleColor(UIColor.black, for: .normal)
        }
        else{
            timerCounting = true
            game_BTN_pause_resume.setTitle("STOP", for: .normal)
            game_BTN_pause_resume.setTitleColor(UIColor.red, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo:nil, repeats: true)
        }
    }
    
    @objc func timerCounter() -> Void{
        //print("\(counter)")
        
        if(counter == 0){
            game_IMG_playerLeft.image = UIImage(named: "card_back")
            game_IMG_playerRight.image = UIImage(named: "card_back")
            counter = counter + 1
        }
        else if(counter == 2){
            if(gameManager.getIsGameOver() == false) {
                gameManager.clockTick()
                game_IMG_playerLeft.image = UIImage(named: gameManager.getPlayerLeftImage())
                game_IMG_playerRight.image = UIImage(named: gameManager.getPlayerRightImage())
                game_LBL_scoreLeft.text = "\(gameManager.getPlayerLeftScore())"
                game_LBL_scoreRight.text = "\(gameManager.getPlayerRightScore())"
                counter = counter + 1
            }
            else{
                timer.invalidate()
                game_BTN_pause_resume.isHidden = true
                moveToEndController();
            }
           
        }
        else if(counter == 5) {
            game_IMG_playerLeft.image = UIImage(named: "card_back")
            game_IMG_playerRight.image = UIImage(named: "card_back")
            counter = 0
        }
        else{
            counter = counter + 1
        }
    }
    
    func moveToEndController() {
        let vc = self.storyboard?.instantiateViewController(identifier: "EndGameController") as! EndGameController
        
        if(gameManager.getPlayerLeftScore() > gameManager.getPlayerRightScore()){
            vc.score = self.gameManager.getPlayerLeftScore()
            vc.playerName = self.gameManager.getPlayerLeftName()
        }
        else{
            vc.score = self.gameManager.getPlayerRightScore()
            vc.playerName = self.gameManager.getPlayerRightName()
        }

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

