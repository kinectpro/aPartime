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
    
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var navBarTitle: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var presenter: CreateEditScreenPresenterProtocol!
    
    var item = Item()

    override func viewDidLoad() {
        super.viewDidLoad()
        CreateEditScreenConfigurator.setupDependencies(viewController: self)
        setupViews()
    }
    
    func setupViews() {
        navigationBarView.layer.shadowColor = UIColor.darkGray.cgColor
        navigationBarView.layer.shadowOpacity = 0.6
        navigationBarView.layer.shadowOffset = CGSize.zero
        navigationBarView.layer.shadowRadius = 4
        switch item.type {
        case .project:
            navigationBarView.backgroundColor = UIColor(red: 100/255, green: 160/255, blue: 190/255, alpha: 1.0)
        case .feature:
            navigationBarView.backgroundColor = UIColor(red: 160/255, green: 190/255, blue: 100/255, alpha: 1.0)
        case .task:
            navigationBarView.backgroundColor = UIColor(red: 190/255, green: 100/255, blue: 160/255, alpha: 1.0)
        }
        navBarTitle.text = (item.name.isEmpty ? "New " : "Edit ") + item.type.rawValue
        nameTextField.text = item.name
        descriptionTextField.text = item.description
        okButton.roundedAndShadowButton()
    }

    //MARK: IBActions
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func okDidTapped(_ sender: UIButton) {
        guard let name = nameTextField.text, let description = descriptionTextField.text, !name.isEmpty else {
            return
        }
        
        var data = [String : Any]()
        
        switch item.type {
        case .project:
            data["description"] = description
        case .feature:
            data["project"] = item.parent
            data["description"] = description
        case .task:
            data["feature"] = item.parent
            data["description"] = description
            data["isStart"] = false
            data["isClose"] = false
            data["isPause"] = false
            data["spentTime"] = 0.0
            data["comments"] = ""
        }
        
        presenter.saveData(category: item.type.rawValue + "s", documentName: name, data: data, success: {
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
