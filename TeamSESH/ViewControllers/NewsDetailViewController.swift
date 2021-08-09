//
//  NewsDetailViewController.swift
//  TeamSESH
//
//  Created by Dalgat Alibekov on 8/10/20.
//  Copyright © 2020 dalgat alibekov. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    @IBOutlet var newsScrollView: UIScrollView!
    @IBOutlet var newsDetailImage: UIImageView!
    @IBOutlet var newsDetailTitle: UILabel!
   
    @IBOutlet var newsDetailDescription: UITextView!
    
    var imageURL: URL? = nil
    var newsDescription: String?
    var newsTitle: String?
    
    override func viewDidLoad() {
    super.viewDidLoad()
    UITextView.appearance().linkTextAttributes = [ .foregroundColor: UIColor.systemBlue ]
        newsDetailTitle.textColor = .white
        newsDetailDescription.textColor = .white
        newsDetailTitle.text = newsTitle
        newsDetailImage.sd_setImage(with: imageURL, completed: nil)
        newsDetailDescription.text = newsDescription
    }
}
