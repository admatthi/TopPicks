//
//  EducationViewController.swift
//  SportsQuant
//
//  Created by talal ahmad on 12/10/2022.
//

import UIKit

class EducationViewController: UIViewController {
    
    
     var toYear: String?{
         get{
             UserDefaults.standard.UserEducationToYear
         }
         set{
             UserDefaults.standard.UserEducationToYear = newValue
         }
     }
     var fromYear: String?{
         get{
             UserDefaults.standard.UserEducationFromYear
         }
         set{
             UserDefaults.standard.UserEducationFromYear = newValue
         }
     }
     var toMonth: String?{
         get{
             UserDefaults.standard.UserEducationToMonth
         }
         set{
             UserDefaults.standard.UserEducationToMonth = newValue
         }
     }
     var fromMonth: String?{
         get{
             UserDefaults.standard.UserEducationFromMonth
         }
         set{
             UserDefaults.standard.UserEducationFromMonth = newValue
         }
     }
     var schoolName: String?{
         get{
             UserDefaults.standard.UserEducationSchoolName
         }
         set{
             UserDefaults.standard.UserEducationSchoolName = newValue
         }
     }
    var isPresentSelected:Bool{
        get{
            UserDefaults.standard.UserEducationPresentSelected
        }
        set{
            UserDefaults.standard.UserEducationPresentSelected = newValue
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
        
        
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
        
        pagingController?.select(pagingItem: IconItem(icon: icons[3].icon, index: 3, title: icons[3].title))
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
        pagingController?.select(pagingItem: IconItem(icon: icons[3].icon, index: 3, title: icons[3].title))
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
    @objc func textFieldschoolNameDidChange(_ textField: UITextField) {
        schoolName = textField.text

    }
}
extension EducationViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EducationDetailTableViewCell", for: indexPath) as! EducationDetailTableViewCell
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
        cell.schoolNameTF.text = schoolName
        cell.fromMonthTF.addTarget(self, action: #selector(EducationViewController.textFieldFromMonthDidChange(_:)), for: .editingChanged)

        cell.fromYearTF.addTarget(self, action: #selector(EducationViewController.textFieldfromYearDidChange(_:)), for: .editingChanged)

        cell.toMonthTF.addTarget(self, action: #selector(EducationViewController.textFieldToMonthDidChange(_:)), for: .editingChanged)

        cell.toYearTF.addTarget(self, action: #selector(EducationViewController.textFieldToYearDidChange(_:)), for: .editingChanged)

        cell.schoolNameTF.addTarget(self, action: #selector(EducationViewController.textFieldschoolNameDidChange(_:)), for: .editingChanged)

        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 800
    }
}
