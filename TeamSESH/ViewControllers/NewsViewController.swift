//
//  NewsViewController.swift
//  TeamSESH
//
//  Created by Dalgat Alibekov on 5/7/20.
//  Copyright © 2020 dalgat alibekov. All rights reserved.
//
import CodableFirebase
import FirebaseDatabase
import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var newsTableView: UITableView!
    
    private var ref: DatabaseReference!
    private var news = [News]()
    private var chosenNews: News?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        title = "Home"

        newsTableView.delegate = self
        newsTableView.dataSource = self
        
        fetchNews()
    }
    func fetchNews() {
        ref = Database.database().reference()
        ref.child("News").observeSingleEvent(of: .value, with: { snapshot in
            
            guard let data = snapshot.value as? NSArray
                else {
                    return
            }
            let items = data.filter { ($0 as? NSDictionary) != nil }
                .map { News(data: $0 as! NSDictionary) }
            self.news.append(contentsOf: items)
            print("NEWS: ", self.news.count)
            DispatchQueue.main.async {
                self.newsTableView.reloadData()
            }
        })
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 235
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: NewsTBCell?
        
        cell = tableView.dequeueReusableCell(withIdentifier: "newsCell") as? NewsTBCell
        if cell == nil {
            cell = NewsTBCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "newsCell")
        }
        cell?.layer.cornerRadius = 15
        cell?.layer.masksToBounds = true
        cell?.selectionStyle = UITableViewCell.SelectionStyle.none
        cell?.setUpNews(news: news[indexPath.row])
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexpath =\(indexPath)")
        chosenNews = news[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let newVC = segue.destination as! NewsDetailViewController
            
            if let news = chosenNews {
                newVC.imageURL = URL(string: news.image)
                newVC.newsDescription = news.description
                newVC.newsTitle = news.title
            }
        }
    }
}

