//
//  APIManager.swift
//  SpaceMonitoring
//
//  Created by Alkesh Fudani on 20/01/20.
//

import UIKit
import ObjectMapper
import Alamofire

enum ErrorNetwork: Error {
    case offline
    case serverError
    case parsingError
}

extension ErrorNetwork: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .offline:
            return NSLocalizedString("Your device is not connected to the internet.", comment: "No internet connection")
        case .serverError:
            return NSLocalizedString("Server error. try after some time", comment: "Server error. try after some time")
        case .parsingError:
            return NSLocalizedString("parsing error. try after some time", comment: "parsing error.")
            
        }
    }
}



class APIManager {
    
    // MARK: Custom Variables
    
//    typealias ResponseBlock = (_ error: Error?, _ response: [String:String]?) -> Void
    typealias ResponseBlock = (_ error: Error?, _ response: [String:Any]?) -> Void

    @discardableResult static func get(_ url: String, completion: ResponseBlock?) -> DataRequest? {
        if !self.isConnectedToNetwork {
            completion?(ErrorNetwork.offline, nil)
            return nil
        }
        
       
        let request = Alamofire.request(url, method: .get, parameters: nil,encoding: JSONEncoding.default, headers: self.header).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let response =  response.value as? [String : Any]else {
                    completion?(ErrorNetwork.parsingError, nil)
                    return
                }
                completion?(nil, response)
                break
            case .failure:
                 completion?(ErrorNetwork.serverError, nil)
                break
            }
            
        }
        
        return request

        //return nil
    }
    
    

    
    // MARK: - Other Methods
    static var isConnectedToNetwork: Bool {
        let network = NetworkReachabilityManager()
        return (network?.isReachable)!
    }
    
    static private var header: HTTPHeaders {
        var dictHeader = HTTPHeaders()
        return dictHeader
    }
}

class BasicModel: Mappable {
    var error: String?
    var status: String?
    var data = [String:Any]()
    var dataArray = [[String:Any]]()
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        error <- map["message"]
        status <- map["status"]
        data <- map["data"]
        dataArray <- map["data"]
        
    }
}


