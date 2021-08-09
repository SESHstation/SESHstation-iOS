//
//  MerchModel.swift
//  TeamSESH
//
//  Created by Dalgat Alibekov on 6/5/20.
//  Copyright © 2020 dalgat alibekov. All rights reserved.
//
import Foundation

struct Merch: Codable {
    let click: String
    let description: String
    let image: String
    let name: String
    let price: String
    
    init(data: NSDictionary) {
            click = data["click"] as! String
            description = data["description"] as! String
            image = data["image"] as! String
            name = data["name"] as! String
            price = data["price"] as! String
        }
    }


