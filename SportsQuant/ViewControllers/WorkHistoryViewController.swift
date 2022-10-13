//
//  WorkHistoryViewController.swift
//  SportsQuant
//
//  Created by talal ahmad on 12/10/2022.
//


import UIKit

class WorkHistoryViewController: UIViewController {
    var isPresentSelected:Bool{
        get{
            UserDefaults.standard.UserWorkHistoryPresentSelected
        }
        set{
            UserDefaults.standard.UserWorkHistoryPresentSelected = newValue
        }
    }
    var toYear: String?{
        get{
            UserDefaults.standard.UserWorkToYear
        }
        set{
            UserDefaults.standard.UserWorkToYear = newValue
        }
    }
    var fromYear: String?{
        get{
            UserDefaults.standard.UserWorkFromYear
        }
        set{
            UserDefaults.standard.UserWorkFromYear = newValue
        }
    }
    var toMonth: String?{
        get{
            UserDefaults.standard.UserWorkToMonth
        }
        set{
            UserDefaults.standard.UserWorkToMonth = newValue
        }
    }
    var fromMonth: String?{
        get{
            UserDefaults.standard.UserWorkFromMonth
        }
        set{
            UserDefaults.standard.UserWorkFromMonth = newValue
        }
    }
    var companyName: String?{
        get{
            UserDefaults.standard.UserWorkCompanyName
        }
        set{
            UserDefaults.standard.UserWorkCompanyName = newValue
        }
    }
    var companyLocation: String?{
        get{
            UserDefaults.standard.UserWorkCompanyLocation
        }
        set{
            UserDefaults.standard.UserWorkCompanyLocation = newValue
        }
    }
    var companyInPosition: String?{
        get{
            UserDefaults.standard.UserWorkCompanyInPosition
        }
        set{
            UserDefaults.standard.UserWorkCompanyInPosition = newValue
        }
    }
    @IBOutlet weak var nextButton: UIButton!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        nextButton.layer.cornerRadius = nextButton.frame.height/2
        nextButton.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        pagingViewController?.select(index: 4,animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func skipThisSectionButtonAction(sender: UIButton){
        let buttonTag = sender.tag
        pagingViewController?.select(index: 4,animated: true)
    }
    @objc func switchChanged(_ sender : UISwitch!){
        isPresentSelected = sender.isOn
          self.tableView.reloadData()
          print("table row switch Changed \(sender.tag)")
          print("The switch is \(sender.isOn ? "ON" : "OFF")")
    }
    @objc func textFieldToMonthDidChange(_ textField: UITextField) {
        toMonth = textField.text

    }
    @objc func textFieldFromMonthDidChange(_ textField: UITextField) {
        fromMonth = textField.text

    }
    @objc func textFieldToYearDidChange(_ textField: UITextField) {
        toYear = textField.text

    }
    @objc func textFieldfromYearDidChange(_ textField: UITextField) {
        fromYear = textField.text

    }

}
extension WorkHistoryViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkDetailTableViewCell", for: indexPath) as! WorkDetailTableViewCell
        cell.skipThisSectionButton.addTarget(self, action: #selector(skipThisSectionButtonAction(sender:)), for: .touchUpInside)
        cell.presentSwitch.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
        
        if isPresentSelected{
            cell.presentSwitch.isOn = true
            if !cell.toDateStackView.isHidden{
                cell.toDateStackView.isHidden = true
            }
        }else{
            cell.presentSwitch.isOn = false

            cell.toDateStackView.isHidden = false
        }
        cell.fromMonthTF.text = fromMonth
        cell.fromYearTF.text = fromYear
        cell.toMonthTF.text = toMonth
        cell.toYearTF.text = toYear
        cell.fromMonthTF.addTarget(self, action: #selector(EducationViewController.textFieldFromMonthDidChange(_:)), for: .editingChanged)

        cell.fromYearTF.addTarget(self, action: #selector(EducationViewController.textFieldfromYearDidChange(_:)), for: .editingChanged)

        cell.toMonthTF.addTarget(self, action: #selector(EducationViewController.textFieldToMonthDidChange(_:)), for: .editingChanged)

        cell.toYearTF.addTarget(self, action: #selector(EducationViewController.textFieldToYearDidChange(_:)), for: .editingChanged)

        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 800
    }
}
