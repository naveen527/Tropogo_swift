//
//  NetworkClient.swift
//  Tropogo
//
//  Created by NAVEEN on 09/01/21.
//

import Foundation
import UIKit
import MobileCoreServices
import Alamofire

// MARK: - NetworkError
/// - generic:    Generic error
/// - invalidURL: Invalid URL error
enum NetworkError: String, Error {
    case generic
    case invalidURL
    case ServerProblem = "Could not connect to the server."
}

enum MethodType: String {
    case POST = "POST"
    case GET = "GET"
    case MULTIPARTWITH_POST = "MULTIPARTWITH_POST"
    case DELETE = "DELETE"
    
}
// MARK: - NetworkClientProtocol
protocol NetworkClientProtocol {
    
    func sendRequestGeneric<T: Encodable>(request: URLRequest,methodType: MethodType,bodyParams:T, completion: @escaping (Data?, URLResponse?, Error?) -> ())
}

// MARK: - NetworkClient
class  NetworkClient: NetworkClientProtocol {
    
    static let sharedInstance = NetworkClient()
    
    func sendRequestGeneric<T: Encodable>(request: URLRequest, methodType: MethodType, bodyParams: T, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        
        
        if NetworkReachability.isConnectedToNetwork() == false {
            UtilityClass.displayAlertWith("CHECKURINTERNETCONNECTION")
            completion(nil, nil, NetworkError.invalidURL)
            return
        }
        guard let url = request.url else {
            completion(nil, nil, NetworkError.invalidURL)
            return
        }
        
        
        
        if methodType.rawValue == "POST" || methodType.rawValue == "DELETE" {
            
            let jsonData = try? JSONEncoder().encode(bodyParams)
            let json = try? JSONSerialization.jsonObject(with: jsonData!, options: .fragmentsAllowed)
            
            Alamofire.request(url, method: HTTPMethod(rawValue: methodType.rawValue)!, parameters: (json as? Parameters), encoding: JSONEncoding.default, headers: ["Accept":"application/json"])
                .responseJSON { response in
                    if let httpStatus = response.response, httpStatus.statusCode == 200 {
                        do{
                            // debugPrint("Success:\(String(describing: response.response))")
                            completion(response.data,response.response,response.error)
                            
                        }
                    }else{
                        //debugPrint("fail:\(String(describing: response.response))")
                        
                        completion(response.data,response.response,response.error)
                    }
                }
            
        }else{
            
            Alamofire.request(url,method: .get,headers: ["Accept":"application/json"]).responseJSON{
                response in
                if let httpStatus = response.response, httpStatus.statusCode == 200 {
                    do{
                        // debugPrint("Success:\(String(describing: response.response))")
                        completion(response.data,response.response,response.error)
                        
                    }
                }else{
                    //debugPrint("fail:\(String(describing: response.response))")
                    
                    completion(response.data,response.response,response.error)
                }
            }
            
        }
        
    }
    
    
}








extension Data {
    mutating func append(string: String) {
        let data = string.data(
            using: String.Encoding.utf8,
            allowLossyConversion: true)
        append(data!)
    }
}
