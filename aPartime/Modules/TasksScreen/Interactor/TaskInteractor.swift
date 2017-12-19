//
//  TaskInteractor.swift
//  aPartime
//
//  Created by Bobby numdevios on 13.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import Foundation
import Firebase

protocol TaskInteractorProtocol {
    
    func getAllTasks(featureName: String, success:@escaping (_ tasks:[Task]) -> Void, fail:@escaping() -> Void)
    func saveStartTime(taskName: String,featureName: String, success:@escaping () -> Void, fail:@escaping() -> Void)
    func saveSpentTime(taskName: String,featureName: String, spentTime: Double, isPause: Bool, success:@escaping () -> Void, fail:@escaping() -> Void)
    func saveStopTime(taskName: String,featureName: String, description:String, success:@escaping () -> Void, fail:@escaping() -> Void)
    func getSpentTime(featureName: String, taskName: String,success:@escaping (_ spentTime:Double) -> Void, fail:@escaping() -> Void)
}

class TaskInteractor: TaskInteractorProtocol {
    
    func saveStartTime(taskName: String,featureName: String, success:@escaping () -> Void, fail:@escaping() -> Void){
        
        getAllTasksDocuments(featureName: featureName, success: { (documents) in
            for doc in documents {
                guard let isStart = doc["isStart"] else {
                    fail()
                    return
                }
                if doc.documentID == taskName && !(isStart as! Bool) {
                    DbManager.shared.defaultStore.collection("tasks").document(taskName).setData(["startTime":Date(), "isStart": true], options: SetOptions.merge()){ err in
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
                    DbManager.shared.defaultStore.collection("tasks").document(taskName).setData(["spentTime":spentTime, "isPause": isPause], options: SetOptions.merge()){ err in
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
    func saveStopTime(taskName: String,featureName: String, description:String, success:@escaping () -> Void, fail:@escaping() -> Void){
        getAllTasksDocuments(featureName: featureName, success: { (documents) in
            for doc in documents {
                if doc.documentID == taskName {
                    DbManager.shared.defaultStore.collection("tasks")
                        .document(taskName)
                        .setData(["descriptionAfterClose":description,
                                   "stopTime": Date(),
                                   "isClose": true], options: SetOptions.merge()){ err in
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
    func getSpentTime(featureName: String, taskName: String,success:@escaping (_ spentTime:Double) -> Void, fail:@escaping() -> Void){
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
    
    func getAllTasks(featureName: String, success:@escaping (_ tasks:[Task]) -> Void, fail:@escaping() -> Void){
        DbManager.shared.defaultStore.collection("tasks").whereField("feature", isEqualTo: featureName).getDocuments() { (querySnapshot, err) in
            
            var tasksList = [Task]()
            
//            if let err = err {
//                print("Error getting list of Tasks: \(err)")
//                fail()
//            } else {
//                for document in querySnapshot!.documents {
//                    tasksList.append(document.documentID)
//                }
//                success(tasksList)
//            }
            self.getAllTasksDocuments(featureName: featureName, success: { (documents) in
                for document in documents {
                    let task = Task()
                    task.name = document.documentID
                    task.spentTime = document["spentTime"] as? Double
                    tasksList.append(task)
                }
                success(tasksList)
            }, fail: {fail()})
        }
    }
    private func getAllTasksDocuments(featureName: String, success:@escaping (_ tasksSnapshots:[DocumentSnapshot]) -> Void, fail:@escaping() -> Void){
        DbManager.shared.defaultStore.collection("tasks").whereField("feature", isEqualTo: featureName).getDocuments() { (querySnapshot, err) in
            
            if let err = err {
                print("Error getting list of TasksDocuments: \(err)")
                fail()
            } else {

                success(querySnapshot!.documents)
            }
        }
    }
    
}

