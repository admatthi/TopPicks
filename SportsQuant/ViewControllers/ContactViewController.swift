//
//  ContactViewController.swift
//  SportsQuant
//
//  Created by talal ahmad on 12/10/2022.
//

import UIKit

class ContactViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!

    @IBOutlet weak var tableView: UITableView!
    var socialLink: String?{
        get{
            UserDefaults.standard.UserSocialLink
        }
        set{
            UserDefaults.standard.UserSocialLink = newValue
        }
    }
    
     var address2: String?{
         get{
             UserDefaults.standard.UserAddress2
         }
         set{
             UserDefaults.standard.UserAddress2 = newValue
         }
     }
     var address1: String?{
         get{
             UserDefaults.standard.UserAddress1
         }
         set{
             UserDefaults.standard.UserAddress1 = newValue
         }
     }
     var websiteLink: String?{
         get{
             UserDefaults.standard.UserWebLink
         }
         set{
             UserDefaults.standard.UserWebLink = newValue
         }
     }
     var phone: String?{
         get{
             UserDefaults.standard.UserPhone
         }
         set{
             UserDefaults.standard.UserPhone = newValue
         }
     }
     var email: String?{
         get{
             UserDefaults.standard.UserEmail
         }
         set{
             UserDefaults.standard.UserEmail = newValue
         }
     }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        nextButton.layer.cornerRadius = nextButton.frame.height/2
        nextButton.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        
        
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
        
        pagingController?.select(pagingItem: IconItem(icon: icons[2].icon, index: 2, title: icons[2].title))
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func textFieldEmailDidChange(_ textField: UITextField) {
        email = textField.text

    }
    @objc func textFieldSocialDidChange(_ textField: UITextField) {
        socialLink = textField.text

    }
    @objc func textFieldaddress1DidChange(_ textField: UITextField) {
        address1 = textField.text

    }
    @objc func textFieldaddress2DidChange(_ textField: UITextField) {
        address2 = textField.text

    }
    @objc func textFieldWebDidChange(_ textField: UITextField) {
        websiteLink = textField.text

    }
    @objc func textFieldPhoneDidChange(_ textField: UITextField) {
        phone = textField.text

    }
}
extension ContactViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactDetailTableViewCell", for: indexPath) as! ContactDetailTableViewCell
        cell.socialLinkTF.text = socialLink
        cell.address1TF.text = address1
        cell.address2TF.text = address2
        cell.emailTF.text = email
        cell.phoneTF.text = phone
        cell.websiteLinkTF.text = websiteLink
        cell.emailTF.addTarget(self, action: #selector(ContactViewController.textFieldEmailDidChange(_:)), for: .editingChanged)
        cell.socialLinkTF.addTarget(self, action: #selector(ContactViewController.textFieldSocialDidChange(_:)), for: .editingChanged)
        cell.address1TF.addTarget(self, action: #selector(ContactViewController.textFieldaddress1DidChange(_:)), for: .editingChanged)
        cell.address2TF.addTarget(self, action: #selector(ContactViewController.textFieldaddress2DidChange(_:)), for: .editingChanged)
        cell.websiteLinkTF.addTarget(self, action: #selector(ContactViewController.textFieldWebDidChange(_:)), for: .editingChanged)
        cell.phoneTF.addTarget(self, action: #selector(ContactViewController.textFieldPhoneDidChange(_:)), for: .editingChanged)



        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1000
    }
}
