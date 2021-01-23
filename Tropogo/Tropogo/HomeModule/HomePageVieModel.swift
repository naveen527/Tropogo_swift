//
//  HomePageVieModel.swift
//  Tropogo
//
//  Created by NAVEEN on 16/01/21.
//

import Foundation

class HomepageViewModel {
    
    fileprivate let networkClient: NetworkClientProtocol
    
    init(networkClient: NetworkClientProtocol = NetworkClient.sharedInstance) {
        self.networkClient = networkClient
    }
    
}


extension HomepageViewModel{
    
    func GetInitialConfigRequestAPI(method:MethodType, onComplete: @escaping (GetInitialConfigResponse) -> ())  {
        
        let baseUrl = TropogoRequestUrl.GetInitialConfig.url()
        let request = URLRequest.init(url: baseUrl)

        let body = GetInitialConfigRequest.init()
        self.networkClient.sendRequestGeneric(request: request, methodType:method, bodyParams: body ) { (data, resp, err) in
            if let httpResponse = resp as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    return
                } else {
                        let response = AESFormat.dataToJsonWithDecription(myData: data!)
                        
                        var my = GetInitialConfigResponse.init(lowestapp_version: "", test_loc_url: "", terms_url: "", playstore_url: "", drone_law_url: "", rzp_key: "", training_url: "", faq_url: "", rzp_secret: "", isSuccess: false)
                        
                        if response == nil{
                            my = GetInitialConfigResponse.init(lowestapp_version: "", test_loc_url: "", terms_url: "", playstore_url: "", drone_law_url: "", rzp_key: "", training_url: "", faq_url: "", rzp_secret: "", isSuccess: false)
                        }else{
                            let lowestapp_version = response?["lowestapp_version"]
                            let test_loc_url = response?["test_loc_url"]
                            let terms_url = response?["terms_url"]
                            let playstore_url = response?["playstore_url"]
                            let drone_law_url = response?["drone_law_url"]
                            let rzp_key = response?["rzp_key"]
                            let training_url = response?["training_url"]
                            let faq_url = response?["faq_url"]
                            let rzp_secret = response?["rzp_secret"]
                            my = GetInitialConfigResponse.init(lowestapp_version: lowestapp_version as? String, test_loc_url: test_loc_url as? String, terms_url: terms_url as? String, playstore_url: playstore_url as? String, drone_law_url: drone_law_url as? String, rzp_key: rzp_key as? String, training_url: training_url as? String, faq_url: faq_url as? String, rzp_secret: rzp_secret as? String, isSuccess: true)
                        }
                        onComplete(my)
                }
                
                
            }
            
        }
    }
    
    
    
}
