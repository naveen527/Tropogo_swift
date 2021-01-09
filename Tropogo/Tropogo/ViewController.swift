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
        
        #if DEBUG
        print("Prod Debug")
        #else
        print("Prod Release")
        #endif
        
        #elseif Dev
        
        #if DEBUG
        print("Dev Debug")
        #else
        print("Dev Release")
        #endif
        
        #elseif Stage
        
        #if DEBUG
        print("Stage Debug")
        #else
        print("Stage Release")
        #endif
        
        #endif
        
        
        // Do any additional setup after loading the view.
    }


}

