//
//  AdditionalViewController.swift
//  SportsQuant
//
//  Created by talal ahmad on 19/10/2022.
//

import UIKit

class AdditionalViewController: UIViewController {

    var sections:[Section]{
        get{
            return retriveSection()
        }
        set{
            saveSection(sounds: newValue)
        }
    }
    @IBOutlet weak var addItemToSectionButton: UIButton!
    @IBOutlet weak var goBackToAllSectionButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var addSectionButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var isAddingNewItem:Bool = false
    var selectedEditIndex:Int?{
        didSet{
            if selectedEditIndex != nil{
                goBackToAllSectionButton.isHidden = false
                addItemToSectionButton.isHidden = false
                addSectionButton.isHidden = true
            }else{
                goBackToAllSectionButton.isHidden = true
                addItemToSectionButton.isHidden = true
                addSectionButton.isHidden = false
            }
        }
    }
    var selectedItemEditIndex:Int?{
        didSet{
            if selectedItemEditIndex != nil{
                goBackToAllSectionButton.isHidden = false
            }else{
                goBackToAllSectionButton.isHidden = true
            }
        }
    }
    var selectedIndex = 0
    var addSectionEnable = false{
        didSet{
            if addSectionEnable{
                backButton.isHidden = false
            }else{
                backButton.isHidden = true
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addSectionEnable = false
        selectedEditIndex = nil
        isAddingNewItem = false

        tableView.dataSource = self
        tableView.delegate = self
        nextButton.layer.cornerRadius = nextButton.frame.height/2
        nextButton.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addItemToSectionButtonAction(_ sender: Any) {
        isAddingNewItem = true
        self.tableView.reloadData()
    }
    @IBAction func goBackToAllSectionButtonAction(_ sender: Any) {
        if isAddingNewItem{
            isAddingNewItem = false
            self.tableView.reloadData()
        }else{
            selectedEditIndex = nil
            self.tableView.reloadData()
        }
    }
    @IBAction func backButtonAction(_ sender: Any) {
        addSectionEnable = false
        self.tableView.reloadData()
    }
    @IBAction func addSectionButton(_ sender: UIButton) {
        
        var sections = sections
        if addSectionEnable || sections.count == 0{
            addSectionEnable = false
            if selectedIndex == 0 {
                if !sections.contains(where: {$0.title == "Technical Skill"}){
                    sections.append(Section(title: "Technical Skill", items: []))
                }
            }else if selectedIndex == 1 {
                if !sections.contains(where: {$0.title == "Language"}){
                    sections.append(Section(title: "Language", items: []))
                }
            }else{
                if !sections.contains(where: {$0.title == "Accomplishments"}){
                    sections.append(Section(title: "Accomplishments", items: []))
                }
            }
            self.sections =  sections
            self.tableView.reloadData()
            return
        }
        if sections.count > 0 {
            addSectionEnable = true
            self.tableView.reloadData()
            return
        }
        
    }
    @IBAction func nextButton(_ sender: Any) {
        if isAddingNewItem{
            isAddingNewItem = false
            self.tableView.reloadData()
        }else{
            pagingController?.select(pagingItem: IconItem(icon: icons[6].icon, index: 6, title: icons[6].title))
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
    @objc func accomplishmentOnTap() {
        print("tapped")
        selectedIndex = 2
        self.tableView.reloadData()
    }
    @objc func languageViewOnTap() {
        print("tapped")
        selectedIndex = 1
        self.tableView.reloadData()

    }
    @objc func techSkillsViewOnTap() {
        print("tapped")
        selectedIndex = 0
        self.tableView.reloadData()

    }
    @objc func editTapped(_ sender: UIButton) {
        var index = sender.tag
        selectedEditIndex = index
        self.tableView.reloadData()
    }
    @objc func deleteTapped(_ sender: UIButton) {
        var index = sender.tag
        sections.remove(at: index)
        self.tableView.reloadData()
    }
    @objc func editItemTapped(_ sender: UIButton) {
        var index = sender.tag
        selectedItemEditIndex = index
        self.tableView.reloadData()
    }
    @objc func deleteItemTapped(_ sender: UIButton) {
        var index = sender.tag
        if let selectedEditIndex = selectedEditIndex{
            sections[selectedEditIndex].items.remove(at: index)
        }
        self.tableView.reloadData()
    }
}
extension AdditionalViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isAddingNewItem{
            return 2
        }else
        if let selectedEditIndex = selectedEditIndex{
            var items = sections[selectedEditIndex].items
            return items.count + 1
        }else
        if sections.count == 0 || addSectionEnable{
            return 1
        }else{
            return sections.count + 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let selectedEditIndex = selectedEditIndex, isAddingNewItem{
            var section = sections[selectedEditIndex]
            if indexPath.row == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "SectionTitleTableViewCell", for: indexPath) as! SectionTitleTableViewCell
                cell.titleLabel.text = section.title
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "SectionTitleTableViewCell", for: indexPath) as! SectionTitleTableViewCell
                cell.titleLabel.text = section.title
                return cell
            }
        }else
        if let selectedEditIndex = selectedEditIndex{
            var section = sections[selectedEditIndex]

            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SectionTitleTableViewCell", for: indexPath) as! SectionTitleTableViewCell
                cell.titleLabel.text = section.title
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "WorkHistoryTableViewCell", for: indexPath) as! WorkHistoryTableViewCell
                cell.mainView.layer.cornerRadius = 10
                cell.mainView.layer.masksToBounds = true
                cell.mainView.layer.borderColor = UIColor.white.cgColor
                cell.mainView.layer.borderWidth = 1
                cell.editButton.tag = indexPath.row
                cell.deleteButton.tag = indexPath.row
                cell.editButton.addTarget(self, action: #selector(editTapped), for: .touchUpInside)
                cell.deleteButton.addTarget(self, action: #selector(deleteTapped), for: .touchUpInside)
                let item = section.items[indexPath.row-1]
                cell.companyNameLabel.text = item.title
                return cell
            }
        }else
        if sections.count == 0 || addSectionEnable{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddAdditionalSectionTableViewCell", for: indexPath) as! AddAdditionalSectionTableViewCell
            let accomplishmentViewTapGesture = UITapGestureRecognizer(target:self,action:#selector(self.accomplishmentOnTap))
            cell.accomplishmentView.addGestureRecognizer(accomplishmentViewTapGesture)
            let languageViewTapGesture = UITapGestureRecognizer(target:self,action:#selector(self.languageViewOnTap))
            cell.languageView.addGestureRecognizer(languageViewTapGesture)
            let techSkillsViewTapGesture = UITapGestureRecognizer(target:self,action:#selector(self.techSkillsViewOnTap))
            cell.techSkillsView.addGestureRecognizer(techSkillsViewTapGesture)
            if selectedIndex == 0 {
                cell.technicalSkillImageView.image = UIImage(systemName: "circle.inset.filled")
                cell.languageImageView.image = UIImage(systemName: "circle")
                cell.accomplishImageView.image = UIImage(systemName: "circle")
            }else if selectedIndex == 1 {
                cell.technicalSkillImageView.image = UIImage(systemName: "circle")
                cell.languageImageView.image = UIImage(systemName: "circle.inset.filled")
                cell.accomplishImageView.image = UIImage(systemName: "circle")
            }else if selectedIndex == 2 {
                cell.technicalSkillImageView.image = UIImage(systemName: "circle")
                cell.languageImageView.image = UIImage(systemName: "circle")
                cell.accomplishImageView.image = UIImage(systemName: "circle.inset.filled")
            }else{
                
            }
            return cell
        }else{
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SectionTitleTableViewCell", for: indexPath) as! SectionTitleTableViewCell
                cell.titleLabel.text = "All Sections"
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "WorkHistoryTableViewCell", for: indexPath) as! WorkHistoryTableViewCell
                cell.mainView.layer.cornerRadius = 10
                cell.mainView.layer.masksToBounds = true
                cell.mainView.layer.borderColor = UIColor.white.cgColor
                cell.mainView.layer.borderWidth = 1
                cell.editButton.tag = indexPath.row-1
                cell.deleteButton.tag = indexPath.row-1
                cell.editButton.addTarget(self, action: #selector(editTapped), for: .touchUpInside)
                cell.deleteButton.addTarget(self, action: #selector(deleteTapped), for: .touchUpInside)
                let section = sections[indexPath.row-1]
                cell.companyNameLabel.text = section.title
                return cell
            }
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isAddingNewItem {
            if indexPath.row == 0{
                return 50
            }else{
                return 300

            }
        }else
        if let selectedEditIndex = selectedEditIndex{
            if indexPath.row == 0 {
                return 50
            }else{
                return 120
            }
        }else
        if sections.count == 0 || addSectionEnable{
            return 500
        }else{
            if indexPath.row == 0{
                return 50

            }else{
                return 120

            }

        }
    }
    
}
