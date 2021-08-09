//
//  Event.swift
//  TeamSESH
//
//  Created by Dalgat Alibekov on 7/15/20.
//  Copyright © 2020 dalgat alibekov. All rights reserved.
//
 import Foundation

struct Event: Codable {
    let description: String
    let imageBanners: String
    let title: String
    
   init(data: NSDictionary) {
           description = data["description"] as! String
           imageBanners = data["imageBanners"] as! String
           title = data["title"] as! String
       }
   }


