//
//  CreateEditScreenPresenter.swift
//  aPartime
//
//  Created by Bobby numdevios on 12.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol CreateEditScreenPresenterProtocol {
    func saveData(category: String, documentName: String, data: [String : Any], success:@escaping () -> Void, fail:@escaping() -> Void)
}

class CreateEditScreenPresenter: CreateEditScreenPresenterProtocol {
    
    var createItemController: CreateEditScreenViewController!
    var createItemRouter: CreateEditScreenRouter!
    var createItemInteractor: CreateEditScreenInteractorProtocol!
    
    func saveData(category: String, documentName: String, data: [String : Any], success:@escaping () -> Void, fail:@escaping() -> Void) {
            createItemInteractor.saveData(category: category, documentName: documentName, data: data, success: {
                success()
        }) {
            fail()
        }
        success()
    }
}
