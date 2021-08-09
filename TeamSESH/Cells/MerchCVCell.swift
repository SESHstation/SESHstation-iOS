//
//  MerchCVCell.swift
//  TeamSESH
//
//  Created by Dalgat Alibekov on 10/3/20.
//  Copyright © 2020 dalgat alibekov. All rights reserved.
//

import UIKit

class MerchCVCell: UICollectionViewCell {

        var url: URL?
        
        @IBOutlet var merchImage: UIImageView!
        @IBOutlet var merchTitle: UILabel!
        @IBOutlet var merchPrice: UILabel!
        @IBAction func merchBtn(_ sender: Any) {guard let url = url else { return }
            UIApplication.shared.open(url)
        }
        func setUpMerch(merch: Merch){
            merchTitle.textColor = .white
            merchPrice.textColor = .white
            merchTitle.text = merch.name
            merchImage.sd_setImage(with: URL(string: merch.image), completed: nil)
            merchPrice.text = merch.price
            url = URL (string: merch.click)
        }
    }



