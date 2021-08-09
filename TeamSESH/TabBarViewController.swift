//
//  TabBarViewController.swift
//  TeamSESH
//
//  Created by Dalgat Alibekov on 9/9/20.
//  Copyright © 2020 dalgat alibekov. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    var vcArray = [UIViewController]()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:
                "homeVC") as! UINavigationController
            vcArray.append(homeVC)
            self.viewControllers = vcArray
            
            let merchVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "merchVC")
            as! UINavigationController
            vcArray.append(merchVC)
            self.viewControllers = vcArray

            let eventsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "eventsVC")
            as! UINavigationController
            vcArray.append(eventsVC)
            self.viewControllers = vcArray
        }
        
    }
