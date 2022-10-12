//
//  ViewController.swift
//  SportsQuant
//
//  Created by Alek Matthiessen on 10/11/22.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {
    var selectedIndex = 0

    @IBOutlet weak var tagsCollectionView: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    var allOdds:[UpcomingOdd] = []
    var allCategories:[Category] = [Category(name: "Upcoming", key: "upcoming"),Category(name: "NFL", key: "americanfootball_nfl"),Category(name: "NBA", key: "basketball_nba"),Category(name: "MLB", key: "baseball_mlb")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tagsCollectionView.dataSource = self
        self.tagsCollectionView.delegate = self
        getCategoryOdd(selectedIndex: selectedIndex)
        // Do any additional setup after loading the view.
    }

    func getCategoryOdd(selectedIndex:Int){
        SVProgressHUD.show()
        var category = allCategories[selectedIndex].key
        ApiModel.getSportsWithCategoryOddsData(category: category ){ response, error in
            SVProgressHUD.dismiss()
            self.allOdds = response ?? []
            self.tableView.reloadData()
            
        }
    }

}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allOdds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SportsBetterDetailTableViewCell", for: indexPath) as! SportsBetterDetailTableViewCell
        let odd = allOdds[indexPath.row]
        cell.titleLabel.text = odd.sportTitle
        cell.awayTeamLabel.text = odd.awayTeam
        cell.homeTeamLabel.text = odd.homeTeam
        
      
        
        var datef = DateFormatter()
        
        datef.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let date1 = datef.date(from: odd.commenceTime ?? "")
 
        var datef2 = DateFormatter()
        
        datef2.dateFormat = "h:mm MM/dd/yyyy"
        
        let date2 = datef2.string(from: date1 ?? Date())

        cell.date.text = date2 ?? ""


        if let booker = odd.bookmakers?.filter({$0.title?.lowercased() == "DraftKings".lowercased()}).first{
            cell.bookMakerLabel.text = booker.title
            if let marketoutcomes = booker.markets?.first?.outcomes{
                if marketoutcomes.count > 1 {
                    cell.FirstTeamNameLabel.text = marketoutcomes[0].name
                    cell.secondTeamNameLabel.text = marketoutcomes[1].name
                    cell.firstTeamOddValueLabel.text = "\(marketoutcomes[0].price ?? 0.0)"
                    cell.secondTeamOddValueLabel.text = "\(marketoutcomes[1].price ?? 0.0)"
                }else if marketoutcomes.count == 1{
                    cell.FirstTeamNameLabel.text = marketoutcomes[0].name
                    cell.firstTeamOddValueLabel.text = "\(marketoutcomes[0].price ?? 0.0)"
                    cell.secondTeamNameLabel.text = ""
                    cell.secondTeamOddValueLabel.text = ""
                }else{
                    cell.FirstTeamNameLabel.text = ""
                    cell.firstTeamOddValueLabel.text = ""
                    cell.secondTeamNameLabel.text = ""
                    cell.secondTeamOddValueLabel.text = ""
                }
            }


        }else{
            cell.bookMakerLabel.text = odd.bookmakers?.first?.title

            if let marketoutcomes = odd.bookmakers?.first?.markets?.first?.outcomes{
                if marketoutcomes.count > 1 {
                    cell.FirstTeamNameLabel.text = marketoutcomes[0].name
                    cell.secondTeamNameLabel.text = marketoutcomes[1].name
                    cell.firstTeamOddValueLabel.text = "\(marketoutcomes[0].price ?? 0.0)"
                    cell.secondTeamOddValueLabel.text = "\(marketoutcomes[1].price ?? 0.0)"
                }else if marketoutcomes.count == 1{
                    cell.FirstTeamNameLabel.text = marketoutcomes[0].name
                    cell.firstTeamOddValueLabel.text = "\(marketoutcomes[0].price ?? 0.0)"
                    cell.secondTeamNameLabel.text = ""
                    cell.secondTeamOddValueLabel.text = ""
                }else{
                    cell.FirstTeamNameLabel.text = ""
                    cell.firstTeamOddValueLabel.text = ""
                    cell.secondTeamNameLabel.text = ""
                    cell.secondTeamOddValueLabel.text = ""
                }
            }
        }
        return cell
    }
    
}
extension ViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagsCollectionViewCell", for: indexPath) as! TagsCollectionViewCell
        cell.titleLabel.text = allCategories[indexPath.row].name
        if selectedIndex == indexPath.row{
            cell.titleLabel.alpha = 1
            cell.myselected.isHidden = false
            cell.myselected.layer.cornerRadius = 4.0
            cell.myselected.layer.masksToBounds = true
            //            cell.layer.cornerRadius = 10
        }else{
            cell.titleLabel.alpha = 0.5
            cell.myselected.isHidden = true
            cell.myselected.layer.cornerRadius = 4.0
            cell.myselected.layer.masksToBounds = true
            
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        self.tagsCollectionView.reloadData()
        self.getCategoryOdd(selectedIndex: selectedIndex)

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 40)
    }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
}
