//
//  WeatherConditionViewController.swift
//  Tropogo
//
//  Created by NAVEEN on 17/01/21.
//

import UIKit


protocol mydelegate {
    func test(resp:ForecastDailyCurrentModel)

}


class WeatherConditionViewController: UIViewController {
    
    let viewModel = ForecastDailyViewModel()
    
     var delegate:mydelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ApiCall()

        // Do any additional setup after loading the view.
    }
    
    func ApiCall() {
        
        let body = ForecastDailyRequestModel.init(lati: 16.3068, longi: 80.4365)
        
//        viewModel.forecastAPIfor3days(method: .GET, bodyParameters: body){ [weak self] (resp) in
//
//            guard  self != nil else { return }
//
//            self?.forecastDisplay(resp: resp)
//
//        }
//
        viewModel.forecastAPIfor2days(method: .GET, bodyParameters: body){ [weak self] (resp) in

            guard  self != nil else { return }

            self?.forecast2DayDisplay(resp: resp)

        }
        
//        viewModel.forecastAPIforcurrent(method: .GET, bodyParameters: body){ [weak self] (resp) in
//
//            guard  self != nil else { return }
//
//            self?.forecastCurrentDisplay(resp: resp)
//
//        }
        
    }
    
    private func forecastDisplay(resp:ForecastDaily3DaysModel){
        
        print(resp)
        
    }
    private func forecast2DayDisplay(resp:ForecastDailyResponseModel){
        
        print(resp)
        
    }
    private func forecastCurrentDisplay(resp:ForecastDailyCurrentModel){
        
        print(resp)
        
        delegate?.test(resp: resp)
    }


}
