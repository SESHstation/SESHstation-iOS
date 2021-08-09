//
//  NewsModel.swift
//  TeamSESH
//
//  Created by Dalgat Alibekov on 5/7/20.
//  Copyright © 2020 dalgat alibekov. All rights reserved.
//

import Foundation

struct News: Codable {
    let description: String
    let image: String
    let title: String
    
    init(data: NSDictionary) {
        description = data["description"] as! String
        image = data["image"] as! String
        title = data["title"] as! String
    }
}

