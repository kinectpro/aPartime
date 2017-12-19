//
//  CreateEditScreenInteractor.swift
//  aPartime
//
//  Created by Bobby numdevios on 12.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import Firebase

protocol CreateEditScreenInteractorProtocol {
    func saveData(category: String, documentName: String, data: [String : Any], success:@escaping () -> Void, fail:@escaping() -> Void)
}

class CreateEditScreenInteractor: CreateEditScreenInteractorProtocol {
    
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
