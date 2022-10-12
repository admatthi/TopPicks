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

var uid = String()

var db : Firestore!


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        db = Firestore.firestore()
        
        Purchases.debugLogsEnabled = true
        
        uid = UIDevice.current.identifierForVendor!.uuidString

        Purchases.debugLogsEnabled = true

        Purchases.configure(withAPIKey: "appl_AozYIhYOTjSTvONMDSUXOWFflCh", appUserID: uid)
        Purchases.shared.delegate = self
        
        ApplicationDelegate.shared.application(
                           application,
                           didFinishLaunchingWithOptions: launchOptions
                       )
        
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

