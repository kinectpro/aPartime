//
//  TasksScreenInteractor.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Firebase
import Foundation

protocol TasksScreenInteractorProtocol {
    func getAllTasks(inFeature: Feature)
    
    func saveStartTime(taskName: String,featureName: String, success:@escaping () -> Void, fail:@escaping() -> Void)
    func saveSpentTime(taskName: String,featureName: String, spentTime: Double, isPause: Bool, success:@escaping () -> Void, fail:@escaping() -> Void)
    func saveStopTime(taskName: String,featureName: String, description:String, success:@escaping () -> Void, fail:@escaping() -> Void)
    func getSpentTime(featureName: String, taskName: String,success:@escaping (_ spentTime:Double) -> Void, fail:@escaping() -> Void)
}

class TasksScreenInteractor: NSObject, TasksScreenInteractorProtocol {
    
    var presenter: TasksScreenPresenterProtocol!
    
    func getAllTasks(inFeature: Feature) {
        DBManager.shared.defaultStore.collection("tasks").whereField("feature", isEqualTo: inFeature.name).getDocuments() { (querySnapshot, error) in
            if let error = error {
                self.presenter.tasksDidGetWithError(error: error.localizedDescription)
                return
            }
            guard let querySnapshot = querySnapshot else {
                self.presenter.tasksDidGetWithError(error: "Get features error")
                return
            }
            var tasks = [Task]()
            for document in querySnapshot.documents {
                if let description = document.data()["description"] as? String, let feature = document.data()["feature"] as? String, let spentTime = document.data()["spentTime"] as? Double {
                    let name = document.documentID
                    let task = Task(name: name, description: description, feature: feature, spentTime: spentTime)
                    tasks.append(task)
                }
            }
            self.presenter.tasksDidGetWithSuccess(tasks: tasks)
        }
    }
    
    
    func saveStartTime(taskName: String, featureName: String, success: @escaping() -> Void, fail: @escaping() -> Void) {
        getAllTasksDocuments(featureName: featureName, success: { (documents) in
            for doc in documents {
                guard let isStart = doc["isStart"] else {
                    fail()
                    return
                }
                if doc.documentID == taskName && !(isStart as! Bool) {
                    DBManager.shared.defaultStore.collection("tasks").document(taskName).setData(["startTime":Date(), "isStart": true], options: SetOptions.merge()){ err in
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
        }) {
            fail()
        }
    }
    
    func saveSpentTime(taskName: String,featureName: String, spentTime: Double, isPause: Bool, success:@escaping () -> Void, fail:@escaping() -> Void){
        getAllTasksDocuments(featureName: featureName, success: { (documents) in
            for doc in documents {
                if doc.documentID == taskName {
                    DBManager.shared.defaultStore.collection("tasks").document(taskName).setData(["spentTime":spentTime, "isPause": isPause], options: SetOptions.merge()) { err in
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
        }) {
            fail()
        }
    }
    
    func saveStopTime(taskName: String, featureName: String, description: String, success: @escaping() -> Void, fail: @escaping() -> Void){
        getAllTasksDocuments(featureName: featureName, success: { (documents) in
            for doc in documents {
                if doc.documentID == taskName {
                    DBManager.shared.defaultStore.collection("tasks").document(taskName).setData(["descriptionAfterClose" : description, "stopTime" : Date(), "isClose": true], options: SetOptions.merge()) { err in
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
        }) {
            fail()
        }
    }
    
    func getSpentTime(featureName: String, taskName: String,success: @escaping (_ spentTime:Double) -> Void, fail: @escaping() -> Void){
        getAllTasksDocuments(featureName: featureName, success: { (documents) in
            for doc in documents {
                if doc.documentID == taskName {
                    guard let time = doc["spentTime"] else {
                        fail()
                        return
                    }
                    print(time as! Double)
                    success(time as! Double)
                }
            }
        }) {
            fail()
        }
    }
    
    private func getAllTasksDocuments(featureName: String, success: @escaping (_ tasksSnapshots: [DocumentSnapshot]) -> Void, fail: @escaping() -> Void){
        DBManager.shared.defaultStore.collection("tasks").whereField("feature", isEqualTo: featureName).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting list of TasksDocuments: \(err)")
                fail()
            } else {
                success(querySnapshot!.documents)
            }
        }
    }
    
}
