//
//  ViewController.swift
//  SportsQuant
//
//  Created by Alek Matthiessen on 10/11/22.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    var allOdds:[UpcomingOdd] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        ApiModel.getSportsUpcommingOddsData { response, error in
            self.allOdds = response ?? []
            self.tableView.reloadData()
            
        }
        // Do any additional setup after loading the view.
    }


}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allOdds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SportsBetterDetailTableViewCell", for: indexPath) as! SportsBetterDetailTableViewCell
        var odd = allOdds[indexPath.row]
        cell.titleLabel.text = odd.sportTitle
        cell.awayTeamLabel.text = odd.awayTeam
        cell.homeTeamLabel.text = odd.homeTeam

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
