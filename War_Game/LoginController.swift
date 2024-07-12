import Foundation
import UIKit
import CoreLocation

class LoginController: UIViewController, LoginAlertDelegate, CLLocationManagerDelegate{
    
    @IBOutlet weak var login_LBL_title: UILabel!
    @IBOutlet weak var login_IMG_leftSide: UIImageView!
    @IBOutlet weak var login_IMG_rightSide: UIImageView!
    @IBOutlet weak var login_BTN_insertName: UIButton!
    
    var locationManager: CLLocationManager!
    
    let preferences = UserDefaults.standard
    let nameKey = "userName"
    
    var playerName: String = ""
    var isNameEntered: Bool = false
    var side: Bool = true; //False = Left  ; True = Right
    
    var isEnabledLocation: Bool = false
    let afekaLon: Double = 34.817549168324334
    var lon: Double?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        login_IMG_leftSide.isHidden = true
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        if (preferences.object(forKey: nameKey) != nil) {
            playerName = preferences.string(forKey: nameKey)!
            login_BTN_insertName.isHidden = true
            login_LBL_title.text = "Hello \(playerName)"
            isNameEntered = true
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            lon = location.coordinate.longitude
            
            if(lon! < afekaLon){
                side = false
                login_IMG_rightSide.isHidden = true
                login_IMG_leftSide.isHidden = false
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get user's location: \(error.localizedDescription)")
        isEnabledLocation = false // Failed to get location
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            isEnabledLocation = true
        default:
            isEnabledLocation = false
        }
    }
    
    @IBAction func login_BTN_insertNameClicked(_ sender: Any) {
        let enterNameAlert = self.storyboard?.instantiateViewController(identifier: "EnterNameAlertController") as! EnterNameAlertController
        enterNameAlert.delgate = self
        enterNameAlert.modalPresentationStyle = .overCurrentContext
        enterNameAlert.providesPresentationContextTransitionStyle = true
        enterNameAlert.definesPresentationContext = true
        enterNameAlert.modalTransitionStyle = .crossDissolve
        enterNameAlert.titleString = "Enter Name"
        self.present(enterNameAlert, animated: true, completion: nil)
    }
    
    func loginAlert_BTN_cancel() {
    }
    
    func loginAlert_BTN_ok(textFieldValue: String) {
        playerName = textFieldValue
        preferences.set(playerName, forKey: nameKey)
        login_BTN_insertName.isHidden = true
        login_LBL_title.text = "Hello \(playerName)"
        isNameEntered = true
    }
    
    @IBAction func login_BTN_startGameClicked(_ sender: Any) {
        
        if(isNameEntered == true && isEnabledLocation == true){
            let vc = self.storyboard?.instantiateViewController(identifier: "GameController") as! GameController
            vc.playerName = self.playerName
            vc.side = self.side
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    

}

