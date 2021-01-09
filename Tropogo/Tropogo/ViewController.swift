//
//  ViewController.swift
//  Tropogo
//
//  Created by NAVEEN on 09/01/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if Prod
        print("Prod")
        
        #elseif Dev
        print("Dev")
        
        #elseif Stage

        print("Stage")

        #endif
        
        
        // Do any additional setup after loading the view.
    }


}

