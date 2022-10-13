//
//  Resume1ViewViewController.swift
//  SportsQuant
//
//  Created by talal ahmad on 13/10/2022.
//

import Foundation
import UIKit

class Resume1ViewViewController: UIViewController {
    @IBOutlet weak var resumeMainView: UIView!
    @IBOutlet weak var educationNameLabel: UILabel!
    
    @IBOutlet weak var workTitleLabel: UILabel!
    @IBOutlet weak var educationTimeLineLabel: UILabel!
    
    @IBOutlet weak var workNameLabel: UILabel!
    
    @IBOutlet weak var workTimeLineLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var linksLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneEmailStackView: UIStackView!
    @IBOutlet weak var PhoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = (UserDefaults.standard.User_First_Name ?? "") + " " + (UserDefaults.standard.User_Last_Name ?? "")
        emailLabel.text = UserDefaults.standard.UserEmail ?? ""
        PhoneLabel.text = UserDefaults.standard.UserPhone ?? ""

        linksLabel.text = "\(UserDefaults.standard.UserWebLink ?? "")  \(UserDefaults.standard.UserSocialLink ?? "")"
        addressLabel.text = "\(UserDefaults.standard.UserAddress1 ?? "")  , \(UserDefaults.standard.UserAddress2 ?? "")"
        descriptionLabel.text =  UserDefaults.standard.UserSummary ?? ""
        descriptionLabel.text =  UserDefaults.standard.UserSummary ?? ""
        educationNameLabel.text = UserDefaults.standard.UserEducationSchoolName ?? ""
        workNameLabel.text = UserDefaults.standard.UserWorkCompanyName ?? ""

        if UserDefaults.standard.UserEducationPresentSelected{
            educationTimeLineLabel.text = "\(UserDefaults.standard.UserEducationFromMonth ?? "")/\(UserDefaults.standard.UserEducationFromYear ?? "") - Present"
        }else{
            educationTimeLineLabel.text = "\(UserDefaults.standard.UserEducationFromMonth ?? "")/\(UserDefaults.standard.UserEducationFromYear ?? "") - \(UserDefaults.standard.UserEducationToMonth ?? "")/\(UserDefaults.standard.UserEducationToYear ?? "")"
        }
        if UserDefaults.standard.UserWorkHistoryPresentSelected{
            workTimeLineLabel.text = "\(UserDefaults.standard.UserWorkFromMonth ?? "")/\(UserDefaults.standard.UserWorkFromYear ?? "") - Present, \(UserDefaults.standard.UserWorkCompanyLocation ?? "")"
        }else{
            workTimeLineLabel.text = "\(UserDefaults.standard.UserWorkFromMonth ?? "")/\(UserDefaults.standard.UserWorkFromYear ?? "") - \(UserDefaults.standard.UserWorkToMonth ?? "")/\(UserDefaults.standard.UserWorkToYear ?? ""), \(UserDefaults.standard.UserWorkCompanyLocation ?? "")"
        }
        workTitleLabel.text = "--- \(UserDefaults.standard.UserWorkCompanyInPosition ?? "")"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBAction func shareButtonAction(_ sender: Any) {
        buildResume()
    }
    func buildResume(){
        
        let fileManager = FileManager.default
        
        CreateResume.shared.generate(scrollView: self.resumeMainView)  { filePath, error in
            guard let filePath = filePath?.relativePath else { return }
            
            
            var identifier:String? = UUID().uuidString

            let firstName = UserDefaults.standard.User_First_Name ?? ""
            let lastName = UserDefaults.standard.User_First_Name ?? ""

            var fileName = "\(firstName.capitalized) \(lastName.capitalized)"
                .trimmingCharacters(in: .whitespacesAndNewlines)
                .replacingOccurrences(of: " ", with: "-")

            if fileName.isEmpty == true {
                fileName = UUID().uuidString
            }

            let sharedMessage = "Resume-\(fileName).pdf"
            if fileManager.fileExists(atPath: filePath) {

                let _file = URL(fileURLWithPath: filePath).createLinkToFile(withName: sharedMessage)

                guard let _file = _file else { return }

                let activityViewController = UIActivityViewController(activityItems: [_file], applicationActivities: nil)
                activityViewController.excludedActivityTypes = [.airDrop]

                DispatchQueue.main.async {
                    if let popoverController = activityViewController.popoverPresentationController {
                        popoverController.sourceRect = CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: 0, height: 0)
                        popoverController.sourceView = self.view
                        popoverController.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
                    }

                    activityViewController.completionWithItemsHandler = { activity, success, items, error in
                        UINavigationBar.appearance().tintColor = .white
                        activityViewController.dismiss(animated: true)
                    }

                    self.present(activityViewController, animated: true) {() -> Void in
                        UINavigationBar.appearance().tintColor = .darkGray
                    }
                }
            }
        }
//        CreateResume.shared.generate(scrollView: self.view)  { filePath, error in
//
//            guard let filePath = filePath?.relativePath else { return }
//
//
//            var identifier:String? = UUID().uuidString
//
//            let firstName = UserDefaults.standard.User_First_Name ?? ""
//            let lastName = UserDefaults.standard.User_First_Name ?? ""
//
//            var fileName = "\(firstName.capitalized) \(lastName.capitalized)"
//                .trimmingCharacters(in: .whitespacesAndNewlines)
//                .replacingOccurrences(of: " ", with: "-")
//
//            if fileName.isEmpty == true {
//                fileName = UUID().uuidString
//            }
//
//            let sharedMessage = "Resume-\(fileName).pdf"
//
//            if fileManager.fileExists(atPath: filePath) {
//
//                let _file = URL(fileURLWithPath: filePath).createLinkToFile(withName: sharedMessage)
//
//                guard let _file = _file else { return }
//
//                let activityViewController = UIActivityViewController(activityItems: [_file], applicationActivities: nil)
//                activityViewController.excludedActivityTypes = [.airDrop]
//
//                DispatchQueue.main.async {
//                    if let popoverController = activityViewController.popoverPresentationController {
//                        popoverController.sourceRect = CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: 0, height: 0)
//                        popoverController.sourceView = self.view
//                        popoverController.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
//                    }
//
//                    activityViewController.completionWithItemsHandler = { activity, success, items, error in
//                        UINavigationBar.appearance().tintColor = .white
//                        activityViewController.dismiss(animated: true)
//                    }
//
//                    self.present(activityViewController, animated: true) {() -> Void in
//                        UINavigationBar.appearance().tintColor = .darkGray
//                    }
//                }
//            }
//        }

    }

}
