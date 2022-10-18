//
//  SummaryDetailTableViewCell.swift
//  SportsQuant
//
//  Created by talal ahmad on 13/10/2022.
//

import UIKit
protocol CopyDescriptionDelegate {
    func didCopyDescription(text:String)
}
var exampleDescriptions:[String] = ["Experienced and driven Advertising Manager with international experience in Digital Display, Programmatic, VOD, and Social Media Planning. From 2012-2017, my direct efforts expanded the company’s active customer base by more than 15%.","Industry recognized executive in General Management (P&L) with over 20 years of experience working for leading technology companies in core networking, security and wireless infrastructure space.", "Senior Account Executive with experience helping companies clean and enrich their data with sales intelligence tools in Marketo, Salesforce, Pardot, and Eloqua. Managing big data effectively, I have helped over 200 clients reduce IT infrastructure overhead by up to 40%.","Graphic designer, problem solver, and adventurer with over 11 years of experience creating and crafting digital experiences, services, and utilities for more than 100 brands. I’m skilled in both design and production and I thrive in startup environments where I can take control of what needs to be done.","Sales and marketing professional with 12 years of experience in digital and print marketing, project management, account management, and relationship development. Experienced in project selection, planning, promoting, and execution.", "Education Social Worker with 18 years of experience. I primarily work with students in 6th-8th grade with social, emotional, adaptive, and other difficulties that may impact one’s ability to succeed personally and academically. Proficient in DBT, crisis management, RtI/MTSS.", "Web Designer proficient in HTML, CSS, and JavaScript, Windows and Mac OS operating systems, and Adobe CS6. Over the last 12 years, I have focused on web, motion, print, video editing, and music creation.", "Senior Consultant focused on operational efficiency, cost reduction, and leveraging large data to help guide better business decisions. Proven success in Non-Labor Cost Reduction, Healthcare Consulting, Payer and Provider Payment Configurations, Big Data Analysis, Financial Reporting, and Strategic Sourcing.", "Digital Marketing Director with over 20 years of experience. Having moved on from traditional marketing strategies, I’ve spent the last 10 years focused on Search Engine Marketing, digital ads and project management. I improve traffic channels such as PPC advertising, SEO, and social media.", "A versatile and creative writer fuses a background in journalism and academics with expertise in business writing to deliver quality, customized material spanning news, marketing, web content, curriculum, and career development. Provides sales support and highly-rated client service and excels in meeting deadlines in quick-turnaround settings.", "Blends academic training in economics and business administration with hands-on experience in sales and operations support to offer employers a track record of delivering on tasks accurately, efficiently, and quickly. Known for providing best-in-class customer service and communications in a variety of business settings.", "A proven leader of US and international sales organizations offers expertise in developing successful growth strategies and training both individual representative and team leaders in product benefits and customer service techniques. Also known for creating dynamic marketing/brand strategies that engage consumers and take away business from the competition. Effectively manages P&L on multimillion-dollar, multi-product lines of business.", "A proven leader of IT startups and established operations offers expertise in defining technical strategies that support overall business objectives. Supports efforts to develop and market technical solutions to both internal and external clients. Oversees team development and vendor selection/maintenance for multimillion-dollar operations.", "Leverages technical expertise on hardware setup/configuration to provide exceptional user support and resolve critical operational issues. Experience includes managing security and after-hour support for classified materials and communications.", "Known for creating and implementing training that expands team member capabilities and instructs users on system utilization/improvement. Works with government, civilian, and corporate stakeholders."]
class SummaryDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var summaryTextView: UITextView!
     var copyDescriptionDelegate: CopyDescriptionDelegate?
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        summaryTextView.layer.cornerRadius = 10
        summaryTextView.layer.masksToBounds = true
        summaryTextView.layer.borderColor = UIColor.white.cgColor
        summaryTextView.layer.borderWidth = 1
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
        let template = exampleDescriptions[index]

        copyDescriptionDelegate?.didCopyDescription(text: template)
    }
}
extension SummaryDetailTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exampleDescriptions.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CopyDescriptionCollectionViewCell", for: indexPath) as! CopyDescriptionCollectionViewCell
        let template = exampleDescriptions[indexPath.row]
        cell.mainView.layer.cornerRadius = 10
        cell.mainView.layer.masksToBounds = true
        cell.descriptionTextView.text = template
        cell.copyButton.tag = indexPath.row
        cell.copyButton.addTarget(self,
                                       action: #selector(self.downloadButtonAction(sender:)),
                for: .touchUpInside)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let template = exampleDescriptions[indexPath.row]

        copyDescriptionDelegate?.didCopyDescription(text: template)
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

