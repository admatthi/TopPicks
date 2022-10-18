//
//  AppDelegate.swift
//  SportsQuant
//
//  Created by Alek Matthiessen on 10/11/22.
//

import UIKit
import FirebaseFirestore
import Firebase
import AudioToolbox
import AVFoundation
import Firebase
import Purchases
import FBSDKCoreKit
import MBProgressHUD
import AVKit
import AVFoundation
import FirebaseDatabase
import FirebaseFirestore
import AppTrackingTransparency
import AdSupport
import Amplitude_iOS
import SVProgressHUD
import AppsFlyerLib
import SwiftyJSON
import IQKeyboardManagerSwift
var uid = String()

var db : Firestore!


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        FirebaseApp.configure()
        db = Firestore.firestore()
        
        Purchases.debugLogsEnabled = true
        
        uid = UIDevice.current.identifierForVendor!.uuidString
        
        ApplicationDelegate.shared.application(
                           application,
                           didFinishLaunchingWithOptions: launchOptions
                       )
        
        AppEvents.activateApp()
        UIApplication.shared.isIdleTimerDisabled = true
        Settings.setAdvertiserTrackingEnabled(true)

        Purchases.debugLogsEnabled = true
        Purchases.configure(withAPIKey: "appl_AozYIhYOTjSTvONMDSUXOWFflCh", appUserID: uid)
        Purchases.shared.delegate = self
        SVProgressHUD.setDefaultMaskType(.clear)

        
        AppsFlyerLib.shared().appsFlyerDevKey = "GSfLvX3FDxH58hR3yDZzZe"
         AppsFlyerLib.shared().appleAppID = "6443812368"
         AppsFlyerLib.shared().delegate = self
         
         AppsFlyerLib.shared().isDebug = true
         
         AppsFlyerLib.shared().waitForATTUserAuthorization(timeoutInterval: 10000)
        
   
        Purchases.shared.purchaserInfo { (purchaserInfo, error) in
            if let purchaserInfo = purchaserInfo{
                
                
                if !purchaserInfo.entitlements.active.isEmpty {
                    
                    if purchaserInfo.entitlements.active.first?.value.periodType == .trial {
                        // here trail implementation
                        
                        
                    }else if purchaserInfo.entitlements.active.first?.value.periodType == .normal {
                        // here normal implementation
                        //here
                        AppEvents.logEvent(.purchased, parameters: ["":""])

                        print("purchased")
                    }else if purchaserInfo.entitlements.active.first?.value.periodType == .intro {
                        // here intro implementation

                    }else if purchaserInfo.entitlements.active.first?.value.periodType == .none {
                        // here none implementation

                    }
                    //user has access to some entitlement
                    didpurchase = true
                    UserDefaults.standard.set(true, forKey: "didPurchase")
                }
            }
        }
        
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")

        if launchedBefore  {
           

                   let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                   let vc : UITabBarController = mainStoryboardIpad.instantiateViewController(withIdentifier: "maintab") as! UITabBarController
                   self.window = UIWindow(frame: UIScreen.main.bounds)
                   self.window?.rootViewController = vc
                   vc.selectedIndex = 0
                   self.window?.makeKeyAndVisible()
        } else {
            
            
            UserDefaults.standard.set(true, forKey: "launchedBefore")

//                        let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                        let vc : PaywalViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "Paywall") as! PaywalViewController
//                        self.window = UIWindow(frame: UIScreen.main.bounds)
//                        self.window?.rootViewController = vc
//            //            vc.selectedIndex = 0
//                        self.window?.makeKeyAndVisible()

            let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc : FirstViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "First") as! FirstViewController
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = vc
//            vc.selectedIndex = 0
            self.window?.makeKeyAndVisible()
            
        }
        
        
        return true
    }



}

extension AppDelegate: PurchasesDelegate {
    func purchases(_ purchases: Purchases, didReceiveUpdated purchaserInfo: Purchases.PurchaserInfo) {
        let purchaserInfo = purchaserInfo
//        if !purchaserInfo.entitlements.active.isEmpty {
//            //user has access to some entitlement
//            didpurchase = true
//            UserDefaults.standard.set(true, forKey: "didPurchase")
//        }

    }
}

