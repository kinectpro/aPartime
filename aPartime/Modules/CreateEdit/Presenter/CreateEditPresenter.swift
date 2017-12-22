//
//  CreateItemPresenter.swift
//  aPartime
//
//  Created by Bobby numdevios on 12.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import UIKit

protocol CreateEditPresenterProtocol {
    func present(item: Item, viewController: UIViewController)
//    func saveData(category: String, documentName: String, data: [String : Any], success:@escaping () -> Void, fail:@escaping() -> Void)
    func saveData(forItem: ItemViewModel)
    func dataDidSaveWithSuccess()
    func dataDidSaveWithError(error: String)
}

class CreateEditPresenter: NSObject, CreateEditPresenterProtocol {
    
    var viewController: CreateEditViewController!
    var interactor: CreateEditInteractorProtocol!
    var router: CreateEditRouterProtocol!
    
    var item = Item()
    
    override init() {
        super.init()
        setupDependencies()
    }
    
    func setupDependencies() {
        guard let viewController = UIStoryboard(name: "CreateEdit", bundle: nil).instantiateViewController(withIdentifier: "CreateEditViewController") as? CreateEditViewController else {
            return
        }
        let interactor = CreateEditInteractor()
        let router = CreateEditRouter()
        viewController.presenter = self
        interactor.presenter = self
        self.viewController = viewController
        self.interactor = interactor
        self.router = router
    }
    
    func present(item: Item, viewController: UIViewController) {
        viewController.present(self.viewController, animated: true)
        self.item = item
        let id = item.id
        let type = item.type
        let name = item.name
        let description = item.description
        let itemViewModel = ItemViewModel(type: type, id: id, name: name, description: description)
        self.viewController.fillFields(forItem: itemViewModel)
    }
    
//    func saveData(category: String, documentName: String, data: [String : Any], success:@escaping () -> Void, fail:@escaping() -> Void) {
//            interactor.saveData(category: category, documentName: documentName, data: data, success: {
//                success()
//        }) {
//            fail()
//        }
//        success()
//    }
    
    func saveData(forItem item: ItemViewModel) {
        self.item.name = item.name
        self.item.description = item.description
        interactor.saveData(forItem: self.item)
    }
    
    func dataDidSaveWithSuccess() {
        print("SUCCESS")
    }
    
    func dataDidSaveWithError(error: String) {
        print("ERROR")
    }
    
}
