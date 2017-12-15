//
//  CreateEditScreenViewController.swift
//  aPartime
//
//  Created by Bobby numdevios on 06.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import UIKit
import Firebase

class CreateEditScreenViewController: UIViewController{
    
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var navBarTitle: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var createItemPresenter: CreateEditScreenPresenterProtocol!
    
    var category = "projects"
    var categoryName = ""
    var project = Project()
    var feature = Feature()
    var task = Task()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CreateEditScreenConfigurator.setupDependencies(createProjectViewController: self)
        let projectName = project.name
        navBarTitle.text = projectName != "" ? "Edit Item" : "New Item"
        nameTextField.text = project.name
        descriptionTextField.text = project.description
        
        self.okButton.roundedAndShadowButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    //MARK: IBActions
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
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
