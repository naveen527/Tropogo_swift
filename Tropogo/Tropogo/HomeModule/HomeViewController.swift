//
//  HomeViewController.swift
//  Tropogo
//
//  Created by NAVEEN on 16/01/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    let viewModel = HomepageViewModel()
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // api call
        self.APICall()
    }
    
    private func APICall(){
        
        viewModel.GetInitialConfigRequestAPI(method: .POST){ [weak self] (resp) in
            
            guard self != nil else { return }
            self?.GetInitialConfigResponse(resp:resp)
            
        }
    }
    
    private func GetInitialConfigResponse(resp:GetInitialConfigResponse){
        
        print("terms_url = \(resp.terms_url ?? "")")
        print("training_url = \(resp.training_url ?? "")")
        print("test_loc_url = \(resp.test_loc_url ?? "")")
        print("rzp_key = \(resp.rzp_key ?? "")")
        print("rzp_secret = \(resp.rzp_secret ?? "")")
        print("faq_url = \(resp.faq_url ?? "")")
        print("lowestapp_version = \(resp.lowestapp_version ?? "")")

        
        
    }

}


extension HomeViewController:mydelegate{
    

    func test(resp: ForecastDailyCurrentModel) {
        print(resp)
    }
    
    
 
    
}
