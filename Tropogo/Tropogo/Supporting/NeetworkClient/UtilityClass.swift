//
//  UtilityClass.swift
//  Tropogo
//
//  Created by NAVEEN on 09/01/21.
//

import UIKit
import Foundation

class UtilityClass: NSObject {

}
extension UtilityClass {
    
    class func displayAlertWith(_ message: String) {
              let alert = UIAlertController(title: "ALERT", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"OK", style: .default, handler: nil))
        DispatchQueue.main.async(execute: {
            UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
        })
    }
    
    // Convert from NSData to json object
    class  func dataToJSON(_ data: Data) -> AnyObject? {
     do {
            let  JSON =  try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            debugPrint("VALID JSON \(JSON) VALID JSON ")
            
        } catch let myJSONError {
            debugPrint(myJSONError)
        }
        return nil
    }
}

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
}

extension URLRequest {
    static func jsonRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
}
