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
    
    var nameProject = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if nameProject != "" {
            navBarTitle.text = "Edit"
            nameTextField.text = nameProject
        }
        self.okButton.roundedAndShadowButton()

    }

    //MARK: IBActions
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func okDidTapped(_ sender: UIButton) {
        
        guard let name = nameTextField.text, !name.isEmpty else {return}
        
        DbManager.shared.defaultStore.collection("projects").document(name).setData([
            "description": descriptionTextField.text ?? ""])
        { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
                self.dismiss(animated: true, completion: nil)
            }
        }
        
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
