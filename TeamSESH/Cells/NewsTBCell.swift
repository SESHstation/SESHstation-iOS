//
//  NewsTBCell.swift
//  TeamSESH
//
//  Created by Dalgat Alibekov on 5/7/20.
//  Copyright © 2020 dalgat alibekov. All rights reserved.
//

import UIKit
import SDWebImage

class NewsTBCell: UITableViewCell {
    
    var url: URL?
    
    @IBOutlet var newsTitle: UILabel!
    @IBOutlet var newsImage: UIImageView!
    @IBAction func seeMoreBtn(_ sender: Any)
        
    {
        guard let url = url else {
            return
        }
        UIApplication.shared.open(url)
    }
    func setUpNews(news: News){
        newsTitle.textColor = .white
        newsTitle.text = news.title
        newsImage.sd_setImage(with: URL(string: news.image), completed: nil)
    }
}




