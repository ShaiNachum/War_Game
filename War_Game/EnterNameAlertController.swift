import Foundation
import UIKit

protocol LoginAlertDelegate{
    func loginAlert_BTN_cancel()
    
    func loginAlert_BTN_ok(textFieldValue: String)
}

class EnterNameAlertController: UIViewController {
    
    @IBOutlet weak var loginAlert_LBL_title: UILabel!
    @IBOutlet weak var loginAlert_TF_enterName: UITextField!
    @IBOutlet weak var loginAlert_ALRT_view: UIView!
    
    let alertViewGrayColor = UIColor(red: 224.0/255.0, green: 224.0/255.0, blue: 224.0/255.0, alpha: 1)
    var delgate: LoginAlertDelegate? = nil
    
    var titleString: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginAlert_LBL_title.text = titleString
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
        animateView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layoutIfNeeded()
    }
    
    func setupView(){
        loginAlert_ALRT_view.layer.cornerRadius = 15
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
    
    func animateView(){
        loginAlert_ALRT_view.alpha = 0
        self.loginAlert_ALRT_view.frame.origin.y = self.loginAlert_ALRT_view.frame.origin.y + 0
        UIView.animate(withDuration: 0.0, animations: {() -> Void in
            self.loginAlert_ALRT_view.alpha = 1.0
            self.loginAlert_ALRT_view.frame.origin.y = self.loginAlert_ALRT_view.frame.origin.y - 0
        })
    }
    
    @IBAction func loginAlert_BTN_cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginAlert_BTN_ok(_ sender: Any) {
        if(loginAlert_TF_enterName.text?.isEmpty == false) {
            delgate?.loginAlert_BTN_ok(textFieldValue: loginAlert_TF_enterName.text!)
            self.dismiss(animated: true, completion: nil)
        }
    }
}
