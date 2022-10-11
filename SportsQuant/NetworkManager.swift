//
//  NetworkManager.swift
//  Cinemeet
//
//  Created by Volodymyr on 12/4/18.
//  Copyright © 2018 Fallinlover AB. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager : NSObject {
    
    static let shared = NetworkManager()
    private override init() {}
    
    func processGETRequest(_ path: String,
                           params:[String: Any]?,
                           headers:[String: String]?,
                           onSuccess:@escaping (_ statusCode: Int, _ data: Any) -> Void,
                           onFailure:@escaping (_ error: Error) -> Void) {
        
        Alamofire.request(path, method: .get, parameters: params, headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success:
                    onSuccess(response.response!.statusCode, response.result.value!)
                case .failure(let error):
                    onFailure(error)
                }
        }
    }
    
    func processGETRequestAsync(_ path: String,
                           params:[String: Any]?,
                           headers:[String: String]?,
                           onSuccess:@escaping (_ statusCode: Int, _ data: Any) -> Void,
                           onFailure:@escaping (_ error: Error) -> Void) {
        let queue = DispatchQueue(label: "com.cnoon.response-queue", qos: .utility, attributes: [.concurrent])
        
        Alamofire.request(path, method: .get, parameters: params, headers: headers)
            .responseJSON(queue: queue) { response in
                switch response.result {
                case .success:
                    onSuccess(response.response!.statusCode, response.result.value!)
                case .failure(let error):
                    onFailure(error)
                }
        }
    }
    
    func processGETRequestWithData(_ path: String,
                           params:[String: Any]?,
                           headers:[String: String]?,
                           onSuccess:@escaping (_ statusCode: Int, _ data: Any) -> Void,
                           onFailure:@escaping (_ error: Error) -> Void) {
        
        Alamofire.request(path, method: .get, parameters: params, headers: headers)
            .responseData { response in
                switch response.result {
                case .success:
                    onSuccess(response.response!.statusCode, response.result.value!)
                case .failure(let error):
                    onFailure(error)
                }
        }
    }
    func processGETRequestAsyncWithTimeout(_ path: String,
                           params:[String: Any]?,
                           headers:[String: String]?,
                           onSuccess:@escaping (_ statusCode: Int, _ data: Any) -> Void,
                           onFailure:@escaping (_ error: Error) -> Void) {
        let queue = DispatchQueue(label: "com.cnoon.response-queue", qos: .utility, attributes: [.concurrent])
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 3
        manager.session.configuration.timeoutIntervalForResource = 3
        
        manager.request(path, method: .get, parameters: params, headers: headers)
            .responseJSON(queue: queue) { response in
                switch response.result {
                case .success:
                    onSuccess(response.response!.statusCode, response.result.value!)
                case .failure(let error):
                    onFailure(error)
                }
        }
    }
    
    func processPOSTRequest(_ path: String,
                            params: [String: Any]?,
                            headers: [String: String]?,
                            onSuccess:@escaping (_ statusCode: Int, _ data: Any) -> Void,
                            onFailure:@escaping (_ error: Error) -> Void) {
        
        Alamofire.request(path, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success:
                    onSuccess(response.response!.statusCode, response.result.value!)
                case .failure(let error):
                    onFailure(error)
                }
        }
    }
    
    func processPOSTRequestWithData(_ path: String,
                            params: [String: Any]?,
                            headers: [String: String]?,
                            onSuccess:@escaping (_ statusCode: Int, _ data: Any) -> Void,
                            onFailure:@escaping (_ error: Error) -> Void) {
        
        Alamofire.request(path, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers)
            .responseData { response in
                switch response.result {
                case .success:
                    onSuccess(response.response!.statusCode, response.result.value!)
                case .failure(let error):
                    onFailure(error)
                }
        }
    }
    func processPATCHRequestWithData(_ path: String,
                            params: [String: Any]?,
                            headers: [String: String]?,
                            onSuccess:@escaping (_ statusCode: Int, _ data: Any) -> Void,
                            onFailure:@escaping (_ error: Error) -> Void) {
        
        Alamofire.request(path, method: .patch, parameters: params, encoding: JSONEncoding.default, headers: headers)
            .responseData { response in
                switch response.result {
                case .success:
                    onSuccess(response.response!.statusCode, response.result.value!)
                case .failure(let error):
                    onFailure(error)
                }
        }
    }
    
    func processPOSTRequestAsync(_ path: String,
                            params: [String: Any]?,
                            headers: [String: String]?,
                            onSuccess:@escaping (_ statusCode: Int, _ data: Any) -> Void,
                            onFailure:@escaping (_ error: Error) -> Void) {
        let queue = DispatchQueue(label: "com.cnoon.response-queue", qos: .utility, attributes: [.concurrent])
        
        Alamofire.request(path, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers)
            .responseJSON(queue: queue) { response in
                switch response.result {
                case .success:
                    onSuccess(response.response!.statusCode, response.result.value!)
                case .failure(let error):
                    onFailure(error)
                }
        }
    }
    
    func processPUTRequest(_ path: String,
                            params: [String: Any]?,
                            headers: [String: String]?,
                            onSuccess:@escaping (_ statusCode: Int, _ data: Any) -> Void,
                            onFailure:@escaping (_ error: Error) -> Void) {
        
        Alamofire.request(path, method: .put, parameters: params, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success:
                    onSuccess(response.response!.statusCode, response.result.value!)
                case .failure(let error):
                    onFailure(error)
                }
        }
    }
    func processPUTRequestwithData(_ path: String,
                            params: [String: Any]?,
                            headers: [String: String]?,
                            onSuccess:@escaping (_ statusCode: Int, _ data: Any) -> Void,
                            onFailure:@escaping (_ error: Error) -> Void) {
        
        Alamofire.request(path, method: .put, parameters: params, encoding: JSONEncoding.default, headers: headers)
            .responseData { response in
                switch response.result {
                case .success:
                    onSuccess(response.response!.statusCode, response.result.value!)
                case .failure(let error):
                    onFailure(error)
                }
        }
    }
    func processPATCHRequest(_ path: String,
                             params: [String: Any]?,
                             headers: [String: String]?,
                             onSuccess:@escaping (_ statusCode: Int, _ data: Any) -> Void,
                             onFailure:@escaping (_ error: Error)->Void) {
        
        Alamofire.request(path, method: .patch, parameters: params, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success:
                    onSuccess(response.response!.statusCode, response.result.value!)
                case .failure(let error):
                    onFailure(error)
                }
        }
    }
    
    func processDELETERequest(_ path: String,
                            params: [String: Any]?,
                            headers: [String: String]?,
                            onSuccess:@escaping (_ statusCode: Int, _ data: Any) -> Void,
                            onFailure:@escaping (_ error: Error) -> Void) {
        
        Alamofire.request(path, method: .delete, parameters: params, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success:
                    onSuccess(response.response!.statusCode, response.result.value!)
                case .failure(let error):
                    onFailure(error)
                }
        }
    }
    func processDELETERequestWithData(_ path: String,
                            params: [String: Any]?,
                            headers: [String: String]?,
                            onSuccess:@escaping (_ statusCode: Int, _ data: Any) -> Void,
                            onFailure:@escaping (_ error: Error) -> Void) {
        
        Alamofire.request(path, method: .delete, parameters: params, encoding: JSONEncoding.default, headers: headers)
            .responseData { response in
                switch response.result {
                case .success:
                    onSuccess(response.response!.statusCode, response.result.value!)
                case .failure(let error):
                    onFailure(error)
                }
        }
    }
    
}
