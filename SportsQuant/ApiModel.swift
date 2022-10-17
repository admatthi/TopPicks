//
//  ApiModel.swift
//  SportsQuant
//
//  Created by talal ahmad on 11/10/2022.
//

import Foundation
import SwiftyJSON

class ApiModel {
    
    class func getSportsUpcommingOddsData(completion: @escaping (_ response:[UpcomingOdd]?, _ error:String?) -> Void) {
        
         let url = "https://api.the-odds-api.com/v4/sports/upcoming/odds/?regions=us&markets=h2h&apiKey=e63b5131db6d478c79bbf10f0da28534"
        let params: [String: Any] = [:]
        NetworkManager.shared.processGETRequestWithData(url, params: params, headers: ["X-API-KEY":"9Zs766JzZe8K7s5DtsgkP159HkB3fNnm6jBZA5FM"], onSuccess: { (code, result) in
             let resultJSON: JSON = JSON(result)
             print("Stocks ==> \(resultJSON)")
             if let response = try? JSONDecoder().decode([UpcomingOdd].self, from: result as! Data){
                 completion(response,nil)
             }else{
                 completion(nil,"something went wrong")
             }
         }) { (error) in
             completion(nil, error.localizedDescription)
             print("ERROR ===> \(error)")
         }
     }
    class func getSportsWithCategoryOddsData(category:String,completion: @escaping (_ response:[UpcomingOdd]?, _ error:String?) -> Void) {
        
         let url = "https://api.the-odds-api.com/v4/sports/\(category)/odds/?regions=us&markets=h2h&apiKey=e63b5131db6d478c79bbf10f0da28534"
        let params: [String: Any] = [:]
        NetworkManager.shared.processGETRequestWithData(url, params: params, headers: ["X-API-KEY":"9Zs766JzZe8K7s5DtsgkP159HkB3fNnm6jBZA5FM"], onSuccess: { (code, result) in
             let resultJSON: JSON = JSON(result)
             print("Stocks ==> \(resultJSON)")
             if let response = try? JSONDecoder().decode([UpcomingOdd].self, from: result as! Data){
                 completion(response,nil)
             }else{
                 completion(nil,"something went wrong")
             }
         }) { (error) in
             completion(nil, error.localizedDescription)
             print("ERROR ===> \(error)")
         }
     }
}
