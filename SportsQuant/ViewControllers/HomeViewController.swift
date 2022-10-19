//
//  HomeViewController.swift
//  SportsQuant
//
//  Created by talal ahmad on 12/10/2022.
//

import UIKit
import Parchment
var pagingViewController:PagingViewController?
class HomeViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true

        setupPageController()
        // Do any additional setup after loading the view.
    }
    
    func setupPageController(){
        let IntoViewControllerVC = storyboard!.instantiateViewController(withIdentifier: "IntoViewController") as! IntoViewController
        IntoViewControllerVC.title = "Intro"
        let ContactViewControllerVC = storyboard!.instantiateViewController(withIdentifier: "ContactViewController") as! ContactViewController
        ContactViewControllerVC.title = "Contact"
        let EducationViewControllerVC = storyboard!.instantiateViewController(withIdentifier: "EducationViewController") as! EducationViewController
        EducationViewControllerVC.title = "Education"
        let WorkHistoryViewControllerVC = storyboard!.instantiateViewController(withIdentifier: "WorkHistoryViewController") as! WorkHistoryViewController
        WorkHistoryViewControllerVC.title = "Work"
        let SummaryViewControllerVC = storyboard!.instantiateViewController(withIdentifier: "SummaryViewController") as! SummaryViewController
        SummaryViewControllerVC.title = "Summary"
        let FinishViewControllerVC = storyboard!.instantiateViewController(withIdentifier: "FinishViewController") as! FinishViewController
        FinishViewControllerVC.title = "Finish"
        
         pagingViewController = PagingViewController(viewControllers: [
            IntoViewControllerVC,ContactViewControllerVC,EducationViewControllerVC,WorkHistoryViewControllerVC,SummaryViewControllerVC,FinishViewControllerVC
        ])
        pagingViewController?.menuItemSize = .fixed(width: UIScreen.main.bounds.width / 3, height: 50)
        pagingViewController?.textColor = UIColor.lightGray
        pagingViewController?.selectedFont = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold)
        
        pagingViewController?.font =  UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold)
        pagingViewController?.selectedTextColor = UIColor.white
        pagingViewController?.selectedBackgroundColor = #colorLiteral(red: 0.0829134658, green: 0.2267663181, blue: 0.5822093487, alpha: 1)
        pagingViewController?.indicatorColor = UIColor.white
        pagingViewController?.backgroundColor = #colorLiteral(red: 0.0829134658, green: 0.2267663181, blue: 0.5822093487, alpha: 1)
        pagingViewController?.borderColor = #colorLiteral(red: 0.0829134658, green: 0.2267663181, blue: 0.5822093487, alpha: 1)
//        pagingViewController.menuBackgroundColor = .secondarySystemBackground
        
        addChild(pagingViewController!)
        view.addSubview(pagingViewController!.view)
        pagingViewController?.didMove(toParent: self)
        pagingViewController?.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            pagingViewController!.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pagingViewController!.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pagingViewController!.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pagingViewController!.view.topAnchor.constraint(equalTo: topView.bottomAnchor)
        ])
    }
    func getNavBarHeight() -> CGFloat {
        let nav = UINavigationController()
        return  UIApplication.shared.statusBarFrame.height

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UITextField {

    func setUnderLine() {
        let border = CALayer()
        let width = CGFloat(1.5)
        border.borderColor = #colorLiteral(red: 0.2581318319, green: 0.3717477918, blue: 0.6468508244, alpha: 1)
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width - 10, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }

}
