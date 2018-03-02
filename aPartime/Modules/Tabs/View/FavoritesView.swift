//
//  FavoritesView.swift
//  aPartime
//
//  Created by Bobby numdevios on 02.03.2018.
//  Copyright © 2018 kinectpro. All rights reserved.
//

import UIKit

protocol FavoritesViewProtocol {
    func showFavorites(favorites: [Favorite])
}

class FavoritesView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var presenter: TabsPresenterProtocol!
    
    var favorites = [Favorite]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let favorite = favorites[index]
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as! FavoriteViewCell
//        if index == 0 {
//            cell.topConstraint.constant = 8.0
//        }
//        if index == favorites.count - 1 {
//            cell.bottomConstraint.constant = 8.0
//        }
        cell.nameLabel.text = favorite.name
        cell.dateLabel.text = "01.01.2025"//favorite.modified
        cell.statusLabel.text = "Pause"//favorite.status.rawValue
        cell.spentTimeLabel.text = stringFromTimeInterval(interval: favorite.spentTime) as String
        return cell
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        let favorite = favorites[index]
        //presenter.openTask(forFeature: favorite.feature)
    }
    
    func showFavorites(favorites: [Favorite]) {
        self.favorites = favorites
        tableView.reloadData()
    }
    
    func stringFromTimeInterval(interval: Double) -> NSString {
        
        let hours = (Int(interval) / 3600)
        let minutes = Int(interval / 60) - Int(hours * 60)
        let seconds = Int(interval) - (Int(interval / 60) * 60)
        
        return NSString(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
    }

}