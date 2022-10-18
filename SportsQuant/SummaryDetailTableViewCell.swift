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
var exampleDescriptions:[String] = ["I am a punctual and motivated individual who is able to work in a busy environment and produce high standards of work. I am an excellent team worker and am able to take instructions from all levels and build up good working relationships with all colleagues. I am flexible, reliable and possess excellent time keeping skills.","I have good interpersonal understanding and communication skills and am a confident team worker with the ability to work on own initiative.","I am a mature person with a sound engineering background.", "I am a confident Fork Lift Truck operator with a good all round knowledge of warehouse duties.","I am a reliable, trustworthy and flexible individual who can learn new skills easily and execute them swiftly.","I am a confident driver with clean driving licence, I have my own transport and an excellent knowledge of local and national road and motorway networks.","I am a confident Fork Lift Truck operator with a good all round knowledge of warehouse duties."]
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

