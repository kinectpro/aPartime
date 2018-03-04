//
//  TabsPresenter.swift
//  aPartime
//
//  Created by Sergey Kobzin on 26.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import UIKit

protocol TabsPresenterProtocol {
    func openTask(forFeature feature:String)
    func favoritesDidGetWithSuccess(favorites: [Favorite])
    func getAllFavorites()
}

class TabsPresenter: NSObject, TabsPresenterProtocol {
    
    var view: UITabBarController!
    var interactor: FavoriteInteractorProtocol!
    var favoritesView: FavoritesView!
    var favorites = [Favorite]()
    
    override init() {
        super.init()
        setupDependencies()
        setupSubmodules()
    }
    
    func setupDependencies() {
        guard let viewController = UIStoryboard(name: "Tabs", bundle: nil).instantiateViewController(withIdentifier: "TabsView") as? UITabBarController else {
            return
        }
        guard let favoritesVC = UIStoryboard(name: "Tabs", bundle: nil).instantiateViewController(withIdentifier: "FavView") as? FavoritesView else {
            return
        }
        view = viewController
        favoritesVC.presenter = self
        favoritesView = favoritesVC
        
        let interactor = FavoriteInteractor()
        interactor.presenter = self
        self.interactor = interactor
    }
    
    func setupSubmodules() {
        guard let navigationView = NavigationPresenter().view else {
            return
        }
        view.viewControllers?.append(navigationView)
    }
    
    func openTask(forFeature feature:String){
        
    }
    
    func favoritesDidGetWithSuccess(favorites: [Favorite]) {
        self.favorites = favorites
        //let taskViewModels = tasks.flatMap({ TaskViewModel(id: $0.id, name: $0.name, spentTime: $0.spentTime) })
        favoritesView.showFavorites(favorites: favorites)
    }
    
    func getAllFavorites(){
        self.interactor.getFavorites()
    }
}
