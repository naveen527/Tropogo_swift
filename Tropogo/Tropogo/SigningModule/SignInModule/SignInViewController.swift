//
//  SignInViewController.swift
//  Tropogo
//
//  Created by NAVEEN on 10/01/21.
//

import UIKit


class SignInViewController: UIViewController {
    
    let viewmodel = SignInViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
       // self.ApiCall()
        
    }
    
    
    /*
     Aim: SendOTP -- Request
     input : mobile number with AES128 Encription
     output : SendOtpResponse
     */
    
    
    private func ApiCall() {
        
        viewmodel.sendOtpRequestAPI(mobileNo:"9844116372", method: .POST){ [weak self] (resp) in
            
            guard self != nil else { return }
            
            self?.UpdateDriverDetailsDisplay(resp: resp)
        }
        
    }
    
    private func UpdateDriverDetailsDisplay(resp:SendOtpResponse) {
        
        print(resp)
        
    }
    
    @IBAction func nextAct(_ sender: UIButton) {
        
        //let vc = (storyboard?.instantiateViewController(identifier: "OtpViewController"))! as OtpViewController
        
        let vv = (storyboard?.instantiateViewController(withIdentifier: "OtpViewController"))! 
        
        self.navigationController?.pushViewController(vv, animated: true)
        
        
        
        
    }
    
}
