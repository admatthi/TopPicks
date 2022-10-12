//
//  PayViewController.swift
//  SportsQuant
//
//  Created by Alek Matthiessen on 10/12/22.
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

@objc protocol SwiftPaywallDelegate {
    func purchaseCompleted(paywall: PayViewController, transaction: SKPaymentTransaction, purchaserInfo: Purchases.PurchaserInfo)
    @objc optional func purchaseFailed(paywall: PayViewController, purchaserInfo: Purchases.PurchaserInfo?, error: Error, userCancelled: Bool)
    @objc optional func purchaseRestored(paywall: PayViewController, purchaserInfo: Purchases.PurchaserInfo?, error: Error?)
}

var ref : DatabaseReference?

var referrer = String()
// for now we are making it true to make this app totally free we will remove this later
var didpurchase = Bool()

class PayViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var monthOptionView: UIView!
    @IBOutlet weak var monthSubtitleLabel: UILabel!
    @IBOutlet weak var monthTitleLabel: UILabel!
    @IBOutlet weak var yearlyOptionView: UIView!
    @IBOutlet weak var yearlySubtitleLabel: UILabel!
    @IBOutlet weak var yearlyTitleLabel: UILabel!
    var delegate : SwiftPaywallDelegate?
    
    var isFromOnboarding = false
    private var offering : Purchases.Offering?
    
    private var offeringId : String?
    
    @IBOutlet weak var termstext: UILabel!
    @IBOutlet weak var disclaimertext: UIButton!
    
    var purchases =         Purchases.configure(withAPIKey: "appl_AozYIhYOTjSTvONMDSUXOWFflCh", appUserID: uid)
    
    
    var anotherline = String()
    
    @IBAction func tapRestore(_ sender: Any) {
        MBProgressHUD.showAdded(to: view, animated: true)
        Purchases.shared.restoreTransactions { (purchaserInfo, error) in
            MBProgressHUD.hide(for: self.view, animated: true)
            //... check purchaserInfo to see if entitlement is now active
            
            if let error = error {
                
                
            } else {
                if let purchaserInfo = purchaserInfo{
                    if !purchaserInfo.entitlements.active.isEmpty {
                        //user has access to some entitlement
                        didpurchase = true
                        UserDefaults.standard.set(true, forKey: "didPurchase")
                        ref?.child("Users").child(uid).updateChildValues(["Purchased" : "True"])
                        
                        //                        didpurchase = true
                        //                     UserDefaults.standard.set(true, forKey: "didPurchase")
                        if self.isFromOnboarding{
                            DispatchQueue.main.async {
                                
                                self.performSegue(withIdentifier: "PaywalltoHome", sender: self)
                            }
                            
                        }else{
                            
                        }
                    }
                }
                //
                
                
                
            }
            
        }
    }
    
    func loadpropersegues() {
        
        
        self.performSegue(withIdentifier: "PaywalltoHome", sender: self)
        
        
        
    }
    
    @IBAction func tapBack(_ sender: Any) {
        
        self.performSegue(withIdentifier: "PaywalltoHome", sender: self)
        
    }
    
    
    @IBAction func tapTerms(_ sender: Any) {
        
        didpurchase = true
        
        self.dismiss(animated: true, completion: nil)
        
        if let url = NSURL(string: "https://resumeplus.webflow.io/privacy-policy-official"
        ) {
            UIApplication.shared.openURL(url as URL)
        }
        
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
   
        //        comingfromnotific = false
    }
    
    
    
    @IBOutlet weak var backimage: UIImageView!
    
    
    
    
    
    @IBAction func tapContinue(_ sender: Any) {
        
        AppEvents.logEvent(.initiatedCheckout)
        
        Amplitude.instance().logEvent("Initiate Checkout", withEventProperties: ["referrer" : referrer])
        
        
        self.requestTrackingPermission()
        
        
        let loadingNotification = MBProgressHUD.showAdded(to: view, animated: true)
        //            AppEvents.logEvent(.initiatedCheckout)
        
        
        guard let package = offering?.availablePackages[0] else {
            print("No available package")
            
            
            MBProgressHUD.hide(for: view, animated: true)
            
            return
        }
        
        
        
        
        Purchases.shared.purchasePackage(package) { (trans, info, error, cancelled) in
            
            MBProgressHUD.hide(for: self.view, animated: true)
            
            if let error = error {
                if let purchaseFailedHandler = self.delegate?.purchaseFailed {
                    purchaseFailedHandler(self, info, error, cancelled)
                } else {
                    if !cancelled {
                        
                    }
                }
            } else  {
                if let purchaseCompletedHandler = self.delegate?.purchaseCompleted {
                    purchaseCompletedHandler(self, trans!, info!)
                    
                    
                    Amplitude.instance().logEvent("Start Trial", withEventProperties: ["referrer" : referrer])
                    
                
                    
                 
                    Analytics.logEvent("StartTrial", parameters: ["":""])
                    
                    //
                    ref?.child("Users").child(uid).updateChildValues(["Purchased" : "True"])
                    
                    didpurchase = true
                    UserDefaults.standard.set(true, forKey: "didPurchase")
                    
                    MBProgressHUD.hide(for: self.view, animated: true)
                    
                    AppEvents.logEvent(.startTrial)
                    
                    AppsFlyerLib.shared().logEvent("Start Trial", withValues: ["referrer" : referrer])
                    
                    
                    Analytics.logEvent("Start Trial", parameters: [:])
                    AnalyticsEventAddToCart
                    
                    
                    self.performSegue(withIdentifier: "PaywalltoHome", sender: self)
                    
                } else {
                    
                    
                    Amplitude.instance().logEvent("Start Trial", withEventProperties: ["referrer" : referrer])
                    
                    //
                    ref?.child("Users").child(uid).updateChildValues(["Purchased" : "True"])
                    
                    MBProgressHUD.hide(for: self.view, animated: true)
                    
                    AppEvents.logEvent(.startTrial)

                  
                    didpurchase = true
                    UserDefaults.standard.set(true, forKey: "didPurchase")
                    
                    AppsFlyerLib.shared().logEvent("Start Trial", withValues: ["referrer" : referrer])
                    
                    Analytics.logEvent("Start Trial", parameters: [:])
                    AnalyticsEventAddToCart
                    
                    
                    self.performSegue(withIdentifier: "PaywalltoHome", sender: self)
                    
                    
                }
            }
        }
        
        
    }
    
    // Helper function to present promo alert view
    func presentPromoAlert(_ discount: SKProductDiscount, shouldPurchase: @escaping (() -> Void)) {
        let price = discount.price
        
        let promoAlert = UIAlertController(
            title: "Thanks for being a loyal user!",
            message: "We'd like to offer you an exclusive deal of only \(price) for 3-months of pro access.",
            preferredStyle: .alert)
        
        promoAlert.addAction(UIAlertAction(
            title: "No thanks",
            style: .cancel,
            handler: nil))
        
        promoAlert.addAction(UIAlertAction(
            title: "Sure!",
            style: .default,
            handler: { _ in
                shouldPurchase()
            }))
        UserDefaults.standard.set(true, forKey: "has_seen_promo_cat_discount")
        self.present(promoAlert, animated: true, completion: nil)
    }
    @IBOutlet weak var leadingtext: UILabel!
    
    @IBOutlet weak var headlinelabel: UILabel!
    @IBOutlet weak var tapcontinue: UIButton!
    
    @IBOutlet weak var tapmonthly: UIButton!
    //    Try 3 days free, then $19.99/year.
    //    Cancel anytime.
    
    
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
    
    
    var currentVersion: String {
        get {
            return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        }
    }
    
    
    
    
    
    //    latest code
    
    func greatfunc() {
        
        print("cool")
    }
    
  
    
    @IBOutlet weak var plabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        AppsFlyerLib.shared().logEvent("Paywall Viewed", withValues: ["" : ""])
        Settings.setAdvertiserTrackingEnabled(true)
        
        
        Amplitude.instance().logEvent("Paywall Viewed", withEventProperties: ["referrer" : referrer])
        
        
        ref = Database.database().reference()
        
        
        
        
        Purchases.shared.offerings { (offerings, error) in
            
            
            
            if let offeringId = self.offeringId {
                
                self.offering = offerings?.offering(identifier: offeringId)
            } else {
                
                self.offering = offerings?.current
            }
            
            
        }
        
        
        
        
        
        
        
    }
    
    @IBOutlet weak var tapx: UIButton!
    
    @IBAction func tapDismiss(_ sender: Any) {
        
        self.performSegue(withIdentifier: "PaywalltoHome", sender: self)
        
        
    }
    
    @IBAction func dismissButtonAction(_ sender: Any) {
        
        
        
    }
    
    private func showAlert(title: String?, message: String?, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: handler))
        self.present(alert, animated: true, completion: nil)
        
        
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

