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
    
}
// MARK: - NetworkClientProtocol
protocol NetworkClientProtocol {
    
    func sendRequestGeneric<T: Encodable>(request: URLRequest,methodType: HTTPMethod,bodyParams:T, completion: @escaping (Data?, URLResponse?, Error?) -> ())
}

// MARK: - NetworkClient
class  NetworkClient: NetworkClientProtocol {
    
    static let sharedInstance = NetworkClient()
    
    func sendRequestGeneric<T: Encodable>(request: URLRequest, methodType: HTTPMethod, bodyParams: T, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        
        
        if NetworkReachability.isConnectedToNetwork() == false {
            UtilityClass.displayAlertWith("CHECKURINTERNETCONNECTION")
            completion(nil, nil, NetworkError.invalidURL)
            return
        }
        guard let url = request.url else {
            completion(nil, nil, NetworkError.invalidURL)
            return
        }
        
        
        let jsonData = try! JSONEncoder().encode(bodyParams)
        let json = try! JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves)
        
        Alamofire.request(url, method: methodType, parameters: (json as! Parameters), encoding: JSONEncoding.default, headers: ["Content-Type":"application/json","Username":"TWEGA","Password":"N0555899111@2020"])
            .responseJSON { response in
                if let httpStatus = response.response, httpStatus.statusCode == 200 {
                    do{
                        completion(response.data,response.response,response.error)
                    }
                }else{
                    completion(response.data,response.response,response.error)
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
