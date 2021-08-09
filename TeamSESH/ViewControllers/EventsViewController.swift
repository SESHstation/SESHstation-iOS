//
//  EventsViewController.swift
//  TeamSESH
//
//  Created by Dalgat Alibekov on 79/29/20.
//  Copyright © 2020 dalgat alibekov. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCrashlytics

class EventsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
        
    @IBOutlet var eventsCollectionView: UICollectionView!
    @IBOutlet var collectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var pageControl: UIPageControl!
    private var ref: DatabaseReference!
    private var events = [Event]()
    private var chosenEvent: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        eventsCollectionView.delegate = self
        eventsCollectionView.dataSource = self
        title = "Events"
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let cellHeight = view.bounds.height / 2
        let cellWidth = UIScreen.main.bounds.width
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionViewHeightConstraint.constant = cellHeight 
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        eventsCollectionView.collectionViewLayout = flowLayout
        
        fetchBanners ()
    }
    func fetchBanners() {
        ref = Database.database().reference()
        ref.child("banners").observeSingleEvent(of: .value, with: { snapshot in
            
            guard let data = snapshot.value as? NSArray else { return }
            let items = data.filter { ($0 as? NSDictionary) != nil }
                .map {  Event (data: $0 as! NSDictionary) }
            self.events.append(contentsOf: items)
            print("Events: ", self.events.count)
            DispatchQueue.main.async { [weak self] in
                self?.pageControl.numberOfPages = self?.events.count ?? 0
                self?.pageControl.currentPage = 0
                self?.eventsCollectionView.reloadData()
            }
        })
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("EVENTS", events.count)
        return events.count
    }
    func collectionView(_ collectionView: UICollectionView,   cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell: EventsCVCell?
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventsCell", for: indexPath) as? EventsCVCell
        cell?.setUpEvents(events: events[indexPath.row])
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("indexpath =\(indexPath)")
        chosenEvent = events[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: self)
    }
   func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.item
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl?.currentPage = Int(scrollView.contentOffset.x)/Int(scrollView.frame.width)
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        pageControl?.currentPage = Int(scrollView.contentOffset.x)/Int(scrollView.frame.width)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let newVC = segue.destination as! EventDetailsViewController
            if let event = chosenEvent {
                newVC.imageURL = URL(string: event.imageBanners)
                newVC.eventDescription = event.description
                newVC.eventTitle = event.title
            }
        }
    }
}
