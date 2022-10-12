//
//  EducationViewController.swift
//  SportsQuant
//
//  Created by talal ahmad on 12/10/2022.
//

import UIKit

class EducationViewController: UIViewController {
    var isPresentSelected = false
    
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
        pagingViewController?.select(index: 3,animated: true)
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
        pagingViewController?.select(index: 3,animated: true)
    }
    @objc func switchChanged(_ sender : UISwitch!){
        isPresentSelected = sender.isOn
          self.tableView.reloadData()
          print("table row switch Changed \(sender.tag)")
          print("The switch is \(sender.isOn ? "ON" : "OFF")")
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

        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 800
    }
}
