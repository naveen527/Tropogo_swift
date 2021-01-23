//
//  BaseUrlConfig.swift
//  Tropogo
//
//  Created by NAVEEN on 16/01/21.
//

import Foundation



struct TropogoConstants {
    
    static let superKey:String = "tropogomobileapp"
    
    static let forecastApi2days:String = "https://api.weather.com/v3/wx/forecast/hourly/2day?geocode=LATITUDE,LONGITUDE&format=json&units=e&language=enUS&apiKey=c4deedc3727244ca9eedc3727224cabe"
    
    static let forecastApi3days:String = "https://api.weather.com/v3/wx/forecast/daily/3day?geocode=LATITUDE,LONGITUDE&format=json&units=e&language=enUS&apiKey=c4deedc3727244ca9eedc3727224cabe"
    
    static let forecastApicurrent:String = "https://api.weather.com/v3/wx/observations/current?geocode=LATITUDE,LONGITUDE&format=json&units=e&language=enUS&apiKey=c4deedc3727244ca9eedc3727224cabe"


}


struct BaseAPI {
    
    #if Prod
    static let baseURLString = "https://devapi.tropogo.com/tropogo/"
    #elseif Dev
    static let baseURLString = "https://devapi.tropogo.com/tropogo/"
    #elseif Stage
    static let baseURLString = "https://devapi.tropogo.com/tropogo/"
    #endif
    
}

protocol UrlConverting {
    func url() -> URL
}

enum TropogoRequestUrl {
    case SendOTP
    case VerifyOTP
    case GetInitialConfig
}

extension TropogoRequestUrl: UrlConverting {
    
    func url() -> URL {
        
        switch self {
        case .SendOTP:
            let SendOTP = "api/SendOTP?mobile_no=\(123456789)"
            return URL(string: "\(BaseAPI.baseURLString)\(SendOTP)")!
            
        case .VerifyOTP:
            let verifyOtp = "api/VerifyOTP"
            return URL(string:"\(BaseAPI.baseURLString)\(verifyOtp)")!
            
        case .GetInitialConfig: //policy/GetInitialConfig
            let config = "policy/GetInitialConfig"
            return URL(string:"\(BaseAPI.baseURLString)\(config)")!
        }
        
    }
    
}






