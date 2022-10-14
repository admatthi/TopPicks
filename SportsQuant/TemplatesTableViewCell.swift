//
//  TemplatesTableViewCell.swift
//  SportsQuant
//
//  Created by talal ahmad on 14/10/2022.
//

import UIKit

class TemplatesTableViewCell: UITableViewCell {

    var templateCategory:TemplateCategory!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let bounds = UIScreen.main.bounds
        let width = bounds.width - 20
        layout.itemSize = CGSize(width: width/2, height: 200)
        collectionView.collectionViewLayout = layout
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @objc func downloadButtonAction(sender : UIButton){
        print(sender.tag)
        let index = sender.tag
    }
}
extension TemplatesTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return templateCategory.templates.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TemplateCollectionViewCell", for: indexPath) as! TemplateCollectionViewCell
        let template = templateCategory.templates[indexPath.row]
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
        let template = templateCategory.templates[indexPath.row]
        if templateCategory.category ==  "Trending"{
            let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc : Resume1ViewViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "Resume1ViewViewController") as! Resume1ViewViewController
            vc.modalPresentationStyle = .fullScreen
            UIApplication.shared.topMostViewController()?.present(vc, animated: true, completion: nil)
        }else if templateCategory.category ==  "New"{
            let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc : Resume1ViewViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "Resume1ViewViewController") as! Resume1ViewViewController
            vc.modalPresentationStyle = .fullScreen
            UIApplication.shared.topMostViewController()?.present(vc, animated: true, completion: nil)
        }else if templateCategory.category ==  "Free"{
            let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc : Resume1ViewViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "Resume1ViewViewController") as! Resume1ViewViewController
            vc.modalPresentationStyle = .fullScreen
            UIApplication.shared.topMostViewController()?.present(vc, animated: true, completion: nil)
        }else if templateCategory.category ==  "Paid"{
            let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc : Resume1ViewViewController = mainStoryboardIpad.instantiateViewController(withIdentifier: "Resume1ViewViewController") as! Resume1ViewViewController
            vc.modalPresentationStyle = .fullScreen
            UIApplication.shared.topMostViewController()?.present(vc, animated: true, completion: nil)
        }else{
            
        }

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let bounds = UIScreen.main.bounds
            let width = bounds.width - 20
        return CGSize(width: width/2, height: 250)
    }

}
extension UIViewController {
    func topMostViewController() -> UIViewController {
        
        if let presented = self.presentedViewController {
            return presented.topMostViewController()
        }
        
        if let navigation = self as? UINavigationController {
            return navigation.visibleViewController?.topMostViewController() ?? navigation
        }
        
        if let tab = self as? UITabBarController {
            return tab.selectedViewController?.topMostViewController() ?? tab
        }
        
        return self
    }
}
extension UIApplication {
    func topMostViewController() -> UIViewController? {
        return self.keyWindow?.rootViewController?.topMostViewController()
    }
}
