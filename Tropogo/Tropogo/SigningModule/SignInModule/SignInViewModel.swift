//
//  SignInViewModel.swift
//  Tropogo
//
//  Created by NAVEEN on 10/01/21.
//

import Foundation
import UIKit

class SignInViewModel {
    
    fileprivate let networkClient: NetworkClientProtocol
    
    init(networkClient: NetworkClientProtocol = NetworkClient.sharedInstance) {
        self.networkClient = networkClient
    }
    

}
extension SignInViewModel {
    
    func sendOtpRequestAPI(mobileNo:String,method:MethodType, onComplete: @escaping (SendOtpResponse) -> ())  {
        
        let baseUrl = TropogoRequestUrl.SendOTP.url()
         
      
        let value = AESFormat.dataToJsonWithEncription(myString: mobileNo)
        
        var urlString: String = baseUrl.absoluteString
        urlString = urlString.replacingOccurrences(of:"123456789", with: "\(value)")
        let convertedUrl = URL(string: urlString)

        let request = URLRequest.init(url: convertedUrl!)

        let body = SendOtpBody.init()
        self.networkClient.sendRequestGeneric(request: request, methodType:method, bodyParams: body ) { (data, resp, err) in
            if let httpResponse = resp as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    return
                } else {
                        let response = AESFormat.dataToJsonWithDecription(myData: data!)
                        
                        var my = SendOtpResponse.init(msg:"", status:"", isSuccess: false)
                        
                        if response == nil{
                             my = SendOtpResponse.init(msg:"", status:"", isSuccess: false)
                        }else{
                            let message = response?["msg"]
                            let status = response?["status"]
                            my = SendOtpResponse.init(msg: message as? String, status: status as? String, isSuccess: true)
                        }
                        onComplete(my)
                }
                
                
            }
            
        }
    }
    
    
    
    
    
    func VerifiyOtpRequestAPI(bodyParams:VerifyOtpInputRequest,method:MethodType, onComplete: @escaping (verifyOtpResponseModel) -> ()){
        
        
        let baseUrl = TropogoRequestUrl.VerifyOTP.url()
         
      
        let value = AESFormat.dataToJsonWithEncription(myString: bodyParams.mobileNumber!)
        
        let addingString = "?mobile_no=\(value)&otp=\(bodyParams.inputOtp ?? "0000")&device_id=\(bodyParams.deviceToken ?? "1234567890")"
        var urlString: String = baseUrl.absoluteString
        urlString = urlString + addingString
        let convertedUrl = URL(string: urlString)

        let request = URLRequest.init(url: convertedUrl!)

        let body = SendOtpBody.init()
        self.networkClient.sendRequestGeneric(request: request, methodType:method, bodyParams: body ) { (data, resp, err) in
            if let httpResponse = resp as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    return
                } else {
                        let response = AESFormat.dataToJsonWithDecription(myData: data!)
                        
                    var my = verifyOtpResponseModel.init(user_category: "", msg: "", status:"", user_id: "", isSuccess: false)
                        
                        if response == nil{
                             my = verifyOtpResponseModel.init(user_category: "", msg: "", status:"", user_id: "", isSuccess: false)
                        }else{
                            
                            let message = response?["msg"]
                            let status = response?["status"]
                            let category = response?["user_category"]
                            let userId = response?["user_id"]
                            
                            my = verifyOtpResponseModel.init(user_category:category as? String, msg:message as? String, status:status  as? String, user_id:userId as? String, isSuccess: true)
                        }
                        onComplete(my)
                }
                
                
            }
            
        }
        
    }
    
    
    
    
    
}
