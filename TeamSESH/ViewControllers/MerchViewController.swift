//
//  MerchViewController.swift
//  TeamSESH
//
//  Created by Dalgat Alibekov on 10/3/20.
//  Copyright © 2020 dalgat alibekov. All rights reserved.
//

import UIKit
import Firebase


class MerchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var merchCollectionView: UICollectionView!
    
    private var cellWidth: CGFloat {
        (view.bounds.width - 48.0) / 2
    }
    
    private var ref: DatabaseReference!
    private var merch = [Merch]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Merch"
        merchCollectionView.delegate = self
        merchCollectionView.dataSource = self
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 16, bottom: 10, right: 16)
        layout.itemSize = CGSize(width: cellWidth, height: 250.0    )
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        merchCollectionView!.collectionViewLayout = layout
        fetchMerch()
    }
    func fetchMerch() {
        ref = Database.database().reference()
        ref.child("Merch").observeSingleEvent(of: .value, with: { snapshot in
            
            guard let data = snapshot.value as? NSArray else { return }
            let items = data.filter { ($0 as? NSDictionary) != nil }
            .map { Merch (data: $0 as! NSDictionary) }
            self.merch.append(contentsOf: items)
            print("MERCH: ", self.merch.count)
            DispatchQueue.main.async {
                self.merchCollectionView.reloadData()
            }
        })
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("MERCH", merch.count)
        return merch.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("cellWidth = \(cellWidth)")
        return .init(width: cellWidth, height: 250.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    
    func collectionView(_ collectionView: UICollectionView,   cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: MerchCVCell?
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "merchCell", for: indexPath) as? MerchCVCell
        cell?.setUpMerch(merch: merch[indexPath.row])
        return cell!
    }
}
