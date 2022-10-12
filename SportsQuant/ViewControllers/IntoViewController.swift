//
//  IntoViewController.swift
//  SportsQuant
//
//  Created by talal ahmad on 12/10/2022.
//

import UIKit

class IntoViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    var firstName:String? = ""
    var lastName:String? = ""
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        firstName = UserDefaults.standard.User_First_Name
        lastName = UserDefaults.standard.User_Last_Name

        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        nextButton.layer.cornerRadius = nextButton.frame.height/2
        nextButton.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        UserDefaults.standard.User_First_Name = firstName
        UserDefaults.standard.User_Last_Name = lastName

        pagingViewController?.select(index: 1,animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func textField(_ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String) -> Bool {

        NSLog("Event Triggered")
        return true
    }
    @objc func textFieldFirstNameDidChange(_ textField: UITextField) {
        firstName = textField.text
        UserDefaults.standard.User_First_Name = firstName

    }
    @objc func textFieldLastNameDidChange(_ textField: UITextField) {
        lastName = textField.text
        UserDefaults.standard.User_Last_Name = lastName
    }
}
extension IntoViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IntroTableViewCell", for: indexPath) as! IntroTableViewCell
        cell.firstNameTextField.addTarget(self, action: #selector(IntoViewController.textFieldFirstNameDidChange(_:)), for: .editingChanged)
        cell.lastNameTextField.addTarget(self, action: #selector(IntoViewController.textFieldLastNameDidChange(_:)), for: .editingChanged)

        cell.firstNameTextField.text = firstName
        cell.lastNameTextField.text = lastName
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 550
    }
}
