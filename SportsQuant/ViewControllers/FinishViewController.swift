//
//  FinishViewController.swift
//  SportsQuant
//
//  Created by talal ahmad on 13/10/2022.
//
import UIKit
struct Template {

    var category:String
    var image:String
    var index : Int
    init(category: String, image: String,index: Int) {
        self.category = category
        self.image = image
        self.index = index
    }
}
class FinishViewController: UIViewController {
    var templates:[Template] = [Template(category: "free", image: "image1", index: 1)]

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let bounds = UIScreen.main.bounds
        let width = bounds.width - 10
        layout.itemSize = CGSize(width: width/2, height: 200)
        collectionView.collectionViewLayout = layout
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        
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
    @objc func downloadButtonAction(sender : UIButton){
        print(sender.tag)
        let index = sender.tag
    }
}
extension FinishViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return templates.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TemplateCollectionViewCell", for: indexPath) as! TemplateCollectionViewCell
        let template = templates[indexPath.row]
        cell.templateImageView.image = UIImage(named: template.image)
        cell.templateImageView.layer.cornerRadius = 2
        cell.templateImageView.layer.masksToBounds = true
        cell.downloadButton.tag = indexPath.row
        cell.downloadButton.addTarget(self,
                                       action: #selector(self.downloadButtonAction(sender:)),
                for: .touchUpInside)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc : Resume1ViewViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "Resume1ViewViewController") as! Resume1ViewViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let bounds = UIScreen.main.bounds
            let width = bounds.width - 10
        return CGSize(width: width/2, height: 250)
    }
 
}
