//
//  CreateProjectViewController.swift
//  aPartime
//
//  Created by Bobby numdevios on 06.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import UIKit
import Firebase

class CreateProjectViewController: UIViewController{
    
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var navBarTitle: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var createItemPresenter: CreateItemPresenterProtocol!
    
    var category = "projects"
    var categoryName = ""
    var nameProject = ""
    var descriptionProject = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CreateItemConfigurator.setupDependencies(createProjectViewController: self)
        
        navBarTitle.text = nameProject != "" ? "Edit Item" : "New Item"
        nameTextField.text = nameProject
        descriptionTextField.text = descriptionProject
        
        self.okButton.roundedAndShadowButton()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    //MARK: IBActions
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //Add item
    @IBAction func okDidTapped(_ sender: UIButton) {
        
        guard category != "" else {return}
        guard let name = nameTextField.text, !name.isEmpty else {return}
        
        var data = [String:Any]()
        
        //data for feature
        if category == "features" {
            
            if categoryName != "" {
                data["project"] = categoryName
            }
            data["description"] = descriptionTextField.text ?? ""
            
        //data for task
        }else if category == "tasks" {
            
            if categoryName != "" {
                data["feature"] = categoryName
            }
            data["description"] = descriptionTextField.text ?? ""
            data["isFinished"] = false
            
         //data for project
        } else if category == "projects" {
            
            data = ["description": descriptionTextField.text ?? ""]
        }
        
        createItemPresenter.saveData(category: category, documentName: name, data: data, success: {
            self.dismiss(animated: true, completion: nil)
        }) {}
        
    }
}

extension UIButton{
    
    func roundedAndShadowButton(){
        
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 7.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 12
        
        
    }
}
