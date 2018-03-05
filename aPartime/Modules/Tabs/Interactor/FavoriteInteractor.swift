//
//  FavoriteInteractor.swift
//  aPartime
//
//  Created by Bobby numdevios on 02.03.2018.
//  Copyright © 2018 kinectpro. All rights reserved.
//

import Foundation
import Firebase

protocol FavoriteInteractorProtocol {
    func getFavorites( success:@escaping (_ favorites:[Favorite]) -> Void, fail:@escaping() -> Void)
    func getFeatureById(_ id: String) -> String
}

class FavoriteInteractor: NSObject, FavoriteInteractorProtocol {
    
    var presenter: TabsPresenterProtocol!
    var defaultStore = DbManager.shared.defaultStore
    
    func getFavorites( success:@escaping (_ favorites:[Favorite]) -> Void, fail:@escaping() -> Void){
        defaultStore.collection("tasks").getDocuments { (querySnapshot, err) in
            
            guard let querySnapshot = querySnapshot else {
                //self.presenter.projectsDidGetWithError(error: "Get projects error")
                fail()
                return
            }
            
            let favorites = querySnapshot.documents.map({ (document) -> Favorite in
                
                let favorite = Favorite()
                favorite.id = document.documentID
                favorite.name = document.data()["name"] as? String ?? ""
                favorite.spentTime = document.data()["spentTime"] as? Double ?? 0.0
                favorite.feature = document.data()["feature"] as? String ?? ""
                
                let statusIndex = document.data()["status"] as? Int ?? 0
                favorite.status = TaskStatus(rawValue: statusIndex)!
                
                favorite.modified = document.data()["modified"] as? Date ?? Date()
                print(favorite.name)
                return favorite
            }).sorted(by: { $0.modified > $1.modified })
            //self.presenter.favoritesDidGetWithSuccess(favorites: favorites)
            success(favorites)
        }
    }
    
    func getFeatureById(_ id: String) -> String{
        var name = ""
        defaultStore.collection("features").document(id).getDocument { (doc, err) in
            name = (doc?.data()["name"] as? String)!
            print(name)
        }
        return name
    }
    
}
