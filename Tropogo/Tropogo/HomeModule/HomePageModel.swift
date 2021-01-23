//
//  HomePageModel.swift
//  Tropogo
//
//  Created by NAVEEN on 16/01/21.
//

import Foundation

//MARK:- GetInitialConfig

struct GetInitialConfigRequest:Codable {
    
}

struct GetInitialConfigResponse:Codable {
    
    /*
     
     Optional<AnyObject>
       ▿ some : 9 elements
         ▿ 0 : 2 elements
           - key : lowestapp_version
           - value : 1.0.0
         ▿ 1 : 2 elements
           - key : test_loc_url
           - value : http://tropogo.com/mobile/find-test-location.html
         ▿ 2 : 2 elements
           - key : terms_url
           - value : http://tropogo.com/mobile/terms-and-conditions.html
         ▿ 3 : 2 elements
           - key : rzp_secret
           - value : vKS24LHr5hTTa042KYzpxJ0J
         ▿ 4 : 2 elements
           - key : faq_url
           - value : http://tropogo.com/mobile/faq.html
         ▿ 5 : 2 elements
           - key : training_url
           - value : http://tropogo.com/mobile/flight-training-organization.html
         ▿ 6 : 2 elements
           - key : rzp_key
           - value : rzp_test_K32dE5bpCNQRoF
         ▿ 7 : 2 elements
           - key : drone_law_url
           - value : http://tropogo.com/mobile/india-guide.html
         ▿ 8 : 2 elements
           - key : playstore_url
           - value : https://play.google.com/store/apps/details?id=com.tropogoinsurance
     
     */
    let lowestapp_version, test_loc_url,terms_url,playstore_url,drone_law_url,rzp_key,training_url,faq_url,rzp_secret: String?
    let isSuccess:Bool?
    
}


