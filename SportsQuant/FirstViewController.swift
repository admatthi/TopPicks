//
//  FirstViewController.swift
//  SportsQuant
//
//  Created by Alek Matthiessen on 10/14/22.
//

import UIKit
import Firebase
import Purchases
import FBSDKCoreKit
import MBProgressHUD
import AppsFlyerLib
import AVKit
import AVFoundation
import FirebaseDatabase
import StoreKit
import Amplitude_iOS
import AppTrackingTransparency
import AdSupport
import FirebaseAnalytics

class FirstViewController: UIViewController {
    @IBOutlet weak var tapcontinue: UIButton!
    
    @IBAction func tapContinue(_ sender: Any) {
        
        self.requestTrackingPermission()

        self.performSegue(withIdentifier: "WelcometoPaywall", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

        tapcontinue.layer.borderColor = UIColor.black.cgColor
        tapcontinue.layer.borderWidth = 3.0
    }
    
    func requestTrackingPermission() {
        
        
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { (status) in
                
                switch status {
                    
                case .authorized:
                    
                    
                    
                    
                    Settings.setAdvertiserTrackingEnabled(true)  //Cannot find 'FBAdSettings' in scope
                    
                    
                    
                case .notDetermined:
                    print("n")
                case .restricted:
                    print("n")
                case .denied:
                    print("n")
                    
                    
                    
                @unknown default:
                    
                    print("n")
                    
                }
                
            }
            
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
