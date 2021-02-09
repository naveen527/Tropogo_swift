//
//  OtpViewController.swift
//  Tropogo
//
//  Created by NAVEEN on 16/01/21.
//

import UIKit

class OtpViewController: UIViewController {
    
    let viewModel = SignInViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         @Aim : verifyOtp
         @parms : mobileNumber,userInput,FCM DeviceToken
         @return : verifyotpResponseModel
         */
        
            // self.APICall()
    }
    
    
    
    
    
    //MARK:- Api Calls
    
    private func APICall(){
        
        let bodyParams = VerifyOtpInputRequest.init(mobileNumber:"9844116372", inputOtp: "1234", deviceToken: "e_GNuoB2VksiiZLpJgFZDz:APA91bEL1mApL-Wgc13rhWGSJerSHAWr6fx-beZZmsaQ1FAnzJz8rpb6EBtx1SZW6e6HcoNYlINFyDLqagVY6m3PelZFOVGy4ZvRUSISgBg6ew7aFR1iqPA8bk8SIRoRuMliPZU8rhDk")
        
        viewModel.VerifiyOtpRequestAPI(bodyParams: bodyParams, method: .POST){ [weak self] (resp) in
            
            guard (self != nil)  else { return }
            
            self?.VerifiyOtpDisplay(resp:resp)
            
        }
        
    }
    
    private func ResendOtpRequest(){
        
        viewModel.sendOtpRequestAPI(mobileNo:"9844116372", method: .POST){ [weak self] (resp) in
            
            guard self != nil else { return }
            
            self?.UpdateDriverDetailsDisplay(resp: resp)
        }
        
    }
    
  
  //MARK:- Response Display Services
    private func VerifiyOtpDisplay(resp:verifyOtpResponseModel){
        
        if resp.isSuccess == true {
            if resp.status == "2" {
                
                // otp in valid
                
            }else if resp.status == "1"{
                // otp valid goto next step
                
            }
        }else{
            // calling api issue
        }
        
    }
    
    private func UpdateDriverDetailsDisplay(resp:SendOtpResponse) {
        
        print(resp)
        
    }
    
    @IBAction func act(_ sender: UIButton) {
        
        let vv = (storyboard?.instantiateViewController(withIdentifier: "UserCategoryViewController"))!
        
        self.navigationController?.pushViewController(vv, animated: true)
    }
    
}

