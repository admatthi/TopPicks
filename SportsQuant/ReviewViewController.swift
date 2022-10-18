//
//  ReviewViewController.swift
//  SportsQuant
//
//  Created by Alek Matthiessen on 10/16/22.
//

import UIKit
import FirebaseFirestore
import Firebase
import StoreKit
import FBSDKCoreKit

class ReviewViewController: UIViewController {

    @IBAction func tapC(_ sender: Any) {
        
        
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
        
        self.performSegue(withIdentifier: "ReviewToPaywall", sender: self)
    }
    @IBOutlet weak var tapc: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        SKStoreReviewController.requestReview()

        tapc.layer.borderWidth = 3
        tapc.layer.cornerRadius = 15
        tapc.clipsToBounds = true
        tapc.layer.borderColor = UIColor.black.cgColor
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
