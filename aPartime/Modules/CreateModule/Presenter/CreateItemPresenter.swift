//
//  CreateItemPresenter.swift
//  aPartime
//
//  Created by Bobby numdevios on 12.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation

protocol CreateItemPresenterProtocol {
    func saveData(category: String, documentName: String, data: [String : Any], success:@escaping () -> Void, fail:@escaping() -> Void)
}

class CreateItemPresenter: CreateItemPresenterProtocol {
    
    var createItemController: CreateProjectViewController!
    var createItemRouter: CreateItemRouter!
    var createItemInteractor: CreateItemInteractorProtocol!
    
    func saveData(category: String, documentName: String, data: [String : Any], success:@escaping () -> Void, fail:@escaping() -> Void) {
            createItemInteractor.saveData(category: category, documentName: documentName, data: data, success: {
                success()
        }) {
            fail()
        }
        success()
    }
}
