//
//  CreateEditInteractor.swift
//  aPartime
//
//  Created by Bobby numdevios on 12.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import Firebase

protocol CreateEditInteractorProtocol {
    func saveData(forItem: Item)
}

class CreateEditInteractor: CreateEditInteractorProtocol {
    
    var presenter: CreateEditPresenterProtocol!
    
    func saveData(forItem item: Item) {
        let id = item.id
        var parent = ""
        switch item.type {
        case .project:
            parent = "team"
        case .feature:
            parent = "project"
        case .task:
            parent = "feature"
        }
        let collection = item.type.rawValue + "s"
        var data = ["name"        : item.name,
                    "description" : item.description,
                    parent        : item.parent,
                    "modified"    : Date()] as [String : Any]
        if id.isEmpty {
            data["created"] = data["modified"]
            if item.type == .task {
                data["spentTime"] = 0.0
                data["status"] = TaskStatus.paused.rawValue
            }
            DbManager.shared.defaultStore.collection(collection).addDocument(data: data, completion: { (error) in
                if let error = error {
                    self.presenter.dataDidSaveWithError(error: error.localizedDescription)
                    return
                }
                self.presenter.dataDidSaveWithSuccess()
            })
        } else {
            DbManager.shared.defaultStore.collection(collection).document(id).setData(data, completion: { (error) in
                if let error = error {
                    self.presenter.dataDidSaveWithError(error: error.localizedDescription)
                    return
                }
                self.presenter.dataDidSaveWithSuccess()
            })
        }
    }
    
}
