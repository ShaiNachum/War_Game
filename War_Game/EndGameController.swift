import Foundation
import UIKit

class EndGameController: UIViewController {

    @IBOutlet weak var end_LBL_winner: UILabel!
    @IBOutlet weak var end_LBL_score: UILabel!
    
    var playerName: String = ""
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        end_LBL_winner.text = "Name: " + playerName
        end_LBL_score.text = "Score: \(score)"
    }
    
    
    @IBAction func end_BTN_backToMenuClicked(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "LoginController") as! LoginController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
    
