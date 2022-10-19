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
    var isAddingNew = false
    var editIndex:Int?{
        didSet{
            if editIndex == nil {
                addNewButton.isHidden = false
            }else{
                addNewButton.isHidden = true
            }
        }
    }
    var currentWorkHistory:WorkHistory?
    var workHistory:[WorkHistory]{
        get{
            return retriveWorkHistory()
        }
        set{
            saveWorkHistory(sounds: newValue)
        }
    }
    @IBOutlet weak var addNewButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addNewButton.isHidden = false
        tableView.dataSource = self
        tableView.delegate = self
        nextButton.layer.cornerRadius = nextButton.frame.height/2
        nextButton.layer.masksToBounds = true
        if workHistory.count == 0 {
            currentWorkHistory = WorkHistory(companyName: "", location: "", postion: "", fromMonth: "", toMonth: "", toYear: "", fromYear: "", isPresentWorking: false)
            editIndex = 0
        }else{
            
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        
        
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
        saveData()
        
        
        pagingController?.select(pagingItem: IconItem(icon: icons[4].icon, index: 4, title: icons[4].title))
    }
    func saveData(isfromNext:Bool = true){
        if workHistory.count == 0{
            if let currentWorkHistory = currentWorkHistory{
                if currentWorkHistory.companyName != "" {
                    workHistory.append(currentWorkHistory)
                    isAddingNew = false
                    self.currentWorkHistory = nil
                    self.editIndex = nil
                    self.tableView.reloadData()
                }else{
                    
                }
            }
        }else{
            guard currentWorkHistory?.companyName != "" else {
                isAddingNew = false
                self.currentWorkHistory = nil
                self.editIndex = nil
                self.tableView.reloadData()
                if isfromNext{
                    pagingController?.select(pagingItem: IconItem(icon: icons[4].icon, index: 4, title: icons[4].title))                }
                return
            }
            guard let editIndex = editIndex else {
                isAddingNew = false
                self.currentWorkHistory = nil
                self.editIndex = nil
                self.tableView.reloadData()
                if isfromNext{
                    
                    pagingController?.select(pagingItem: IconItem(icon: icons[4].icon, index: 4, title: icons[4].title))
                    
                }
                return
                
            }
            guard let currentWorkHistory = currentWorkHistory else {
                isAddingNew = false
                self.currentWorkHistory = nil
                self.editIndex = nil
                self.tableView.reloadData()
                if isfromNext{
                    
                    pagingController?.select(pagingItem: IconItem(icon: icons[4].icon, index: 4, title: icons[4].title))
                    
                }
                return
                
            }
            if isAddingNew{
                workHistory.append(currentWorkHistory)
            }else{
                workHistory[editIndex] = currentWorkHistory
            }
            isAddingNew = false
            self.currentWorkHistory = nil
            self.editIndex = nil
            self.tableView.reloadData()
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
    @objc func skipThisSectionButtonAction(sender: UIButton){
        let buttonTag = sender.tag
        pagingController?.select(pagingItem: IconItem(icon: icons[4].icon, index: 4, title: icons[4].title))
        
    }
    @objc func backButtonButtonAction(sender: UIButton){
        let buttonTag = sender.tag
        saveData(isfromNext: false)
    }
    @IBAction func addNewButtonAction(_ sender: Any) {
        isAddingNew = true
        currentWorkHistory = WorkHistory(companyName: "", location: "", postion: "", fromMonth: "", toMonth: "", toYear: "", fromYear: "", isPresentWorking: false)
        if workHistory.isEmpty {
            editIndex = 0

        }else{
            editIndex = workHistory.count - 1

        }
        self.tableView.reloadData()
    }
    @objc func switchChanged(_ sender : UISwitch!){
        guard let editIndex = editIndex else {return}
        guard let currentWorkHistory = currentWorkHistory else {return}
        currentWorkHistory.isPresentWorking = sender.isOn
        
        self.tableView.reloadData()
        print("table row switch Changed \(sender.tag)")
        print("The switch is \(sender.isOn ? "ON" : "OFF")")
    }
    @objc func textFieldToMonthDidChange(_ textField: UITextField) {
        guard let editIndex = editIndex else {return}
        guard let currentWorkHistory = currentWorkHistory else {return}
        currentWorkHistory.toMonth  = textField.text ?? ""
    }
    @objc func textFieldFromMonthDidChange(_ textField: UITextField) {
        guard let editIndex = editIndex else {return}
        guard let currentWorkHistory = currentWorkHistory else {return}
        currentWorkHistory.fromMonth  = textField.text ?? ""

    }
    @objc func textFieldToYearDidChange(_ textField: UITextField) {
        guard let editIndex = editIndex else {return}
        guard let currentWorkHistory = currentWorkHistory else {return}
        currentWorkHistory.toYear  = textField.text ?? ""


    }
    @objc func textFieldfromYearDidChange(_ textField: UITextField) {
        guard let editIndex = editIndex else {return}
        guard let currentWorkHistory = currentWorkHistory else {return}
        currentWorkHistory.fromYear  = textField.text ?? ""


    }
    @objc func textFieldNameDidChange(_ textField: UITextField) {
        guard let editIndex = editIndex else {return}
        guard let currentWorkHistory = currentWorkHistory else {return}
        currentWorkHistory.companyName  = textField.text ?? ""


    }
    @objc func textFieldlocationDidChange(_ textField: UITextField) {
        guard let editIndex = editIndex else {return}
        guard let currentWorkHistory = currentWorkHistory else {return}
        currentWorkHistory.location  = textField.text ?? ""


    }
    @objc func textFieldcompanyInPositionDidChange(_ textField: UITextField) {
        guard let editIndex = editIndex else {return}
        guard let currentWorkHistory = currentWorkHistory else {return}
        currentWorkHistory.postion  = textField.text ?? ""
    }
    @objc func editTapped(_ sender: UIButton) {
        var index = sender.tag
        editIndex = index
        currentWorkHistory = workHistory[index]
        self.tableView.reloadData()
    }
    @objc func deleteTapped(_ sender: UIButton) {
        var index = sender.tag
        workHistory.remove(at: index)
        currentWorkHistory = nil
        editIndex = nil
        if workHistory.count == 0 {
            currentWorkHistory = WorkHistory(companyName: "", location: "", postion: "", fromMonth: "", toMonth: "", toYear: "", fromYear: "", isPresentWorking: false)
            editIndex = 0
        }else{
            
        }
        self.tableView.reloadData()
    }

}
extension WorkHistoryViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if workHistory.count == 0 || editIndex != nil {

            let cell = tableView.dequeueReusableCell(withIdentifier: "WorkDetailTableViewCell", for: indexPath) as! WorkDetailTableViewCell
            guard let editIndex = editIndex else {return cell}
            guard let currentWorkHistory = currentWorkHistory else {return cell}
            cell.backButon.addTarget(self, action: #selector(backButtonButtonAction(sender:)), for: .touchUpInside)

            cell.skipThisSectionButton.addTarget(self, action: #selector(skipThisSectionButtonAction(sender:)), for: .touchUpInside)
            cell.presentSwitch.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
            
            if currentWorkHistory.isPresentWorking ?? false{
                cell.presentSwitch.isOn = true
                if !cell.toDateStackView.isHidden{
                    cell.toDateStackView.isHidden = true
                }
            }else{
                cell.presentSwitch.isOn = false

                cell.toDateStackView.isHidden = false
            }
            cell.fromMonthTF.text = currentWorkHistory.fromMonth
            cell.fromYearTF.text = currentWorkHistory.fromYear
            cell.toMonthTF.text = currentWorkHistory.toMonth
            cell.toYearTF.text = currentWorkHistory.toYear
            cell.fromMonthTF.addTarget(self, action: #selector(WorkHistoryViewController.textFieldFromMonthDidChange(_:)), for: .editingChanged)

            cell.fromYearTF.addTarget(self, action: #selector(WorkHistoryViewController.textFieldfromYearDidChange(_:)), for: .editingChanged)

            cell.toMonthTF.addTarget(self, action: #selector(WorkHistoryViewController.textFieldToMonthDidChange(_:)), for: .editingChanged)

            cell.toYearTF.addTarget(self, action: #selector(WorkHistoryViewController.textFieldToYearDidChange(_:)), for: .editingChanged)
            cell.companyNameLabel.addTarget(self, action: #selector(WorkHistoryViewController.textFieldNameDidChange(_:)), for: .editingChanged)
            cell.companyLocationLabel.addTarget(self, action: #selector(WorkHistoryViewController.textFieldlocationDidChange(_:)), for: .editingChanged)
            cell.companyInPositionLabel.addTarget(self, action: #selector(WorkHistoryViewController.textFieldcompanyInPositionDidChange(_:)), for: .editingChanged)
            
            cell.companyNameLabel.text = currentWorkHistory.companyName
            cell.companyLocationLabel.text = currentWorkHistory.location
            cell.companyInPositionLabel.text = currentWorkHistory.postion
            cell.skipThisSectionButton.isHidden = true
            cell.backButon.isHidden = true
            if workHistory.count == 0 {
                cell.skipThisSectionButton.isHidden = false
                cell.backButon.isHidden = true
            }else{
                cell.skipThisSectionButton.isHidden = true
                cell.backButon.isHidden = false
            }
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "WorkHistoryTableViewCell", for: indexPath) as! WorkHistoryTableViewCell
            var work = workHistory[indexPath.row]
            cell.mainView.layer.cornerRadius = 10
            cell.mainView.layer.masksToBounds = true
            cell.mainView.layer.borderColor = UIColor.white.cgColor
            cell.mainView.layer.borderWidth = 1
            cell.companyNameLabel.text = work.companyName
            cell.postionLabel.text = work.postion
            cell.editButton.tag = indexPath.row
            cell.deleteButton.tag = indexPath.row
            cell.editButton.addTarget(self, action: #selector(editTapped), for: .touchUpInside)
            cell.deleteButton.addTarget(self, action: #selector(deleteTapped), for: .touchUpInside)

            return cell
        
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if workHistory.count == 0 || editIndex != nil{
            return 1
        }else{
            return workHistory.count
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if workHistory.count == 0 || editIndex != nil{
            return 850
        }else{
            return 150
        }
       
    }
}
