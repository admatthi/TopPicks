//
//  AdditionalViewController.swift
//  SportsQuant
//
//  Created by talal ahmad on 19/10/2022.
//

import UIKit

class AdditionalViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var addSectionButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        nextButton.layer.cornerRadius = nextButton.frame.height/2
        nextButton.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addSectionButton(_ sender: UIButton) {
        
    }
    @IBAction func nextButton(_ sender: Any) {
        pagingController?.select(pagingItem: IconItem(icon: icons[6].icon, index: 6, title: icons[6].title))

        
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
    
}
extension AdditionalViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
}
