//
//  SummaryViewController.swift
//  SportsQuant
//
//  Created by talal ahmad on 13/10/2022.
//


import UIKit

class SummaryViewController: UIViewController, UITextViewDelegate, CopyDescriptionDelegate {
    func didCopyDescription(text: String) {
        if let userSummary = userSummary{
            self.userSummary = ((userSummary ?? "") +  "\n" + text)

        }else{
            self.userSummary = text
        }
        self.tableView.reloadData()
    }
    
    var userSummary: String?{
        get{
            UserDefaults.standard.UserSummary
        }
        set{
            UserDefaults.standard.UserSummary = newValue
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
        
        pagingViewController?.select(index: 5,animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func textViewDidChange(_ textView: UITextView) {
        userSummary = textView.text
    }
}
extension SummaryViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryDetailTableViewCell", for: indexPath) as! SummaryDetailTableViewCell
        cell.summaryTextView.delegate = self
        cell.summaryTextView.text = userSummary
        cell.copyDescriptionDelegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1000
    }
}
