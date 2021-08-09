//
//  EventsDetailViewController.swift
//  TeamSESH
//
//  Created by Dalgat Alibekov on 8/9/20.
//  Copyright © 2020 dalgat alibekov. All rights reserved.
//

import UIKit

class EventDetailsViewController: UIViewController {
    
    @IBOutlet var eventScrollView: UIScrollView!
    @IBOutlet var eventsDetailImage: UIImageView!
    @IBOutlet var eventsDetailDescription: UITextView!
    @IBOutlet var eventsDetailTitle: UILabel!
   
    var imageURL: URL? = nil
    var eventDescription: String?
    var eventTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITextView.appearance().linkTextAttributes = [ .foregroundColor: UIColor.systemBlue ]
        eventsDetailImage.sd_setImage(with: imageURL, completed: nil)
        eventsDetailDescription.text = eventDescription
        eventsDetailDescription.textColor = .white
        eventsDetailTitle.text = eventTitle
        eventsDetailTitle.textColor = .white
    }
}
