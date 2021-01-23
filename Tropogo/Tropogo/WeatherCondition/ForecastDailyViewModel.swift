//
//  ForecastDailyViewModel.swift
//  Tropogo
//
//  Created by NAVEEN on 17/01/21.
//

import Foundation

class ForecastDailyViewModel {
    
    fileprivate let networkClient: NetworkClientProtocol
    
    init(networkClient: NetworkClientProtocol = NetworkClient.sharedInstance) {
        self.networkClient = networkClient
    }
    
}

extension ForecastDailyViewModel {
    
    func forecastAPIfor2days(method:MethodType,bodyParameters:ForecastDailyRequestModel,onComplete: @escaping(ForecastDailyResponseModel) -> ()){
        
        var urlString = TropogoConstants.forecastApi2days
        
        urlString = urlString.replacingOccurrences(of:"LATITUDE", with:"\(bodyParameters.lati ?? 123)")
        urlString = urlString.replacingOccurrences(of:"LONGITUDE", with:"\(bodyParameters.longi ?? 324)")
        
        let request = URLRequest.init(url: URL(string: urlString)!)
        
        let body = GetInitialConfigRequest.init()
        self.networkClient.sendRequestGeneric(request: request, methodType:method, bodyParams: body ) { (data, resp, err) in 
            if let httpResponse = resp as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    return
                } else {
                    
                    do {
                        
                        let data = data
                        let model = try JSONSerialization.jsonObject(with: data!) as? [String: Any]
                        debugPrint(model as Any)
                        let myJobModel = try JSONDecoder().decode(ForecastDailyResponseModel.self, from: data!)
                        onComplete(myJobModel)
                    }catch let parsingError {
                        debugPrint("parsing error,\(parsingError)")
                        return
                    }
                }
            }
            
        }
    }
    
    
    
    func forecastAPIfor3days(method:MethodType,bodyParameters:ForecastDailyRequestModel,onComplete: @escaping(ForecastDaily3DaysModel) -> ()){
        
        var urlString = TropogoConstants.forecastApi3days
        
        urlString = urlString.replacingOccurrences(of:"LATITUDE", with:"\(bodyParameters.lati ?? 123)")
        urlString = urlString.replacingOccurrences(of:"LONGITUDE", with:"\(bodyParameters.longi ?? 324)")
        
        let request = URLRequest.init(url: URL(string: urlString)!)
        
        let body = GetInitialConfigRequest.init()
        self.networkClient.sendRequestGeneric(request: request, methodType:method, bodyParams: body ) { (data, resp, err) in
            if let httpResponse = resp as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    return
                } else {
                    
                    do {
                        
                        let data = data
                        let model = try JSONSerialization.jsonObject(with: data!) as? [String: Any]
                        debugPrint(model as Any)
                        let myJobModel = try JSONDecoder().decode(ForecastDaily3DaysModel.self, from: data!)
                        onComplete(myJobModel)
                    }catch let parsingError {
                        debugPrint("parsing error,\(parsingError)")
                        return
                    }
                }
            }
            
        }
    }
    
    func forecastAPIforcurrent(method:MethodType,bodyParameters:ForecastDailyRequestModel,onComplete: @escaping(ForecastDailyCurrentModel) -> ()){
        
        var urlString = TropogoConstants.forecastApicurrent
        
        urlString = urlString.replacingOccurrences(of:"LATITUDE", with:"\(bodyParameters.lati ?? 123)")
        urlString = urlString.replacingOccurrences(of:"LONGITUDE", with:"\(bodyParameters.longi ?? 324)")
        
        let request = URLRequest.init(url: URL(string: urlString)!)
        
        let body = GetInitialConfigRequest.init()
        self.networkClient.sendRequestGeneric(request: request, methodType:method, bodyParams: body ) { (data, resp, err) in
            if let httpResponse = resp as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    return
                } else {
                    
                    do {
                        
                        let data = data
                        let model = try JSONSerialization.jsonObject(with: data!) as? [String: Any]
                        debugPrint(model as Any)
                        let myJobModel = try JSONDecoder().decode(ForecastDailyCurrentModel.self, from: data!)
                        onComplete(myJobModel)
                    }catch let parsingError {
                        debugPrint("parsing error,\(parsingError)")
                        return
                    }
                }
            }
            
        }
    }
}
