//
//  CreateItemInteractor.swift
//  aPartime
//
//  Created by Bobby numdevios on 12.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import Firebase

protocol CreateItemInteractorProtocol {
    func saveData(category: String, documentName: String, data: [String : Any], success:@escaping () -> Void, fail:@escaping() -> Void)
}

class CreateItemInteractor: CreateItemInteractorProtocol {
    
    func saveData(category: String, documentName: String, data: [String : Any], success:@escaping () -> Void, fail:@escaping() -> Void) {
        DbManager.shared.defaultStore.collection(category).document(documentName).setData(data, options: SetOptions.merge()) { err in
            if let err = err {
                print("Error writing document: \(err)")
                fail()
            } else {
                print("Document successfully written!")
                success()
            }
        }
    }
    
}
