//
//  FinishViewController.swift
//  SportsQuant
//
//  Created by talal ahmad on 13/10/2022.
//
import UIKit
struct Template {

    var name:String
    var image:String
    var index : Int
    init(name: String, image: String,index: Int) {
        self.name = name
        self.image = image
        self.index = index
    }
}
struct TemplateCategory {

    var category:String
    var templates:[Template]
    init(category: String, templates: [Template]) {
        self.category = category
        self.templates = templates
    }
}
class FinishViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    var trendingAddedCategory = TemplateCategory(category: "Technology", templates:[Template(name: "Trending Template 1", image: "image1", index: 1),Template(name: "Trending Template 2", image: "image1", index: 2),Template(name: "Trending Template 3", image: "image1", index: 3)])

    var newlyAddedCategory = TemplateCategory(category: "Education", templates:[Template(name: "New Template 1", image: "image1", index: 1),Template(name: "New Template 2", image: "image1", index: 2),Template(name: "New Template 3", image: "image1", index: 3)])

    var freeCategory = TemplateCategory(category: "Health", templates:[Template(name: "Free Template 1", image: "image1", index: 1),Template(name: "Free Template 2", image: "image1", index: 2),Template(name: "Free Template 3", image: "image1", index: 3)])
    
    var paidCategory = TemplateCategory(category: "Sales", templates:[Template(name: "Paid Template 1", image: "image1", index: 1),Template(name: "Paid Template 2", image: "image1", index: 2),Template(name: "Paid Template 3", image: "image1", index: 3)])
    
    var businessCategory = TemplateCategory(category: "Business", templates:[Template(name: "Paid Template 1", image: "image1", index: 1),Template(name: "Paid Template 2", image: "image1", index: 2),Template(name: "Paid Template 3", image: "image1", index: 3)])


    var templatesCategories:[TemplateCategory] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        templatesCategories.append(trendingAddedCategory)
        templatesCategories.append(newlyAddedCategory)
        templatesCategories.append(freeCategory)
        templatesCategories.append(paidCategory)

        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        
        
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
        
        let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : Resume1ViewViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "Resume1ViewViewController") as! Resume1ViewViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return templatesCategories.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TemplatesTableViewCell", for: indexPath) as! TemplatesTableViewCell
        var templateCategory = templatesCategories[indexPath.row]
        cell.templateCategory = templateCategory
        cell.titleLabel.text = templateCategory.category
        return cell
    }
}

