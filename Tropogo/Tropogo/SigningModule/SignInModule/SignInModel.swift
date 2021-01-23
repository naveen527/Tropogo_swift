//
//  SignInModel.swift
//  Tropogo
//
//  Created by NAVEEN on 10/01/21.
//

import Foundation

//MARK:- SendOtp
struct SendOtpBody:Codable {
}

struct SendOtpResponse:Codable {
    
    let msg, status: String?
    let isSuccess:Bool?
}

//MARK:- VerifyOtp

struct VerifyOtpInputRequest:Codable {
    let mobileNumber,inputOtp,deviceToken:String?
}

struct  verifyOtpResponseModel:Codable {
    
    /*
     msg = "OTP verified successfully.";
     status = 1;
     "user_category" = "COMMERCIAL PILOT";
     "user_id" = FlyBindazzAVP7CNC984;
     
     */
    let user_category,msg,status,user_id:String?
    let isSuccess:Bool?

}

