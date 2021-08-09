//
//  CustomNavBar.swift
//  TeamSESH
//
//  Created by Dalgat Alibekov on 9/10/20.
//  Copyright © 2020 dalgat alibekov. All rights reserved.
//

import UIKit

class CustomNavBar: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    
    }

}
