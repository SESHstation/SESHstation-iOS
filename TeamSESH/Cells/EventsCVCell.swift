//
//  EventsCollectionViewCell.swift
//  TeamSESH
//
//  Created by Dalgat Alibekov on 7/27/20.
//  Copyright © 2020 dalgat alibekov. All rights reserved.
//


import UIKit
import SDWebImage

class EventsCVCell: UICollectionViewCell {
    
    var url: URL?
    
    @IBOutlet var eventsImage: UIImageView!

    func setUpEvents(events: Event){
    
    eventsImage.sd_setImage(with: URL(string: events.imageBanners), completed: nil)
    }
}


