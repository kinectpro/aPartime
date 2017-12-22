//
//  CreateEditViewController.swift
//  aPartime
//
//  Created by Bobby numdevios on 06.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import UIKit
import Firebase

protocol CreateEditViewControllerProtocol {
    func fillFields(forItem: ItemViewModel)
}

class CreateEditViewController: UIViewController, CreateEditViewControllerProtocol {
    
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var navBarTitle: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var presenter: CreateEditPresenterProtocol!
    
    var item = ItemViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        navBarTitle.text = (item.id.isEmpty ? "Create " : "Edit ") + item.type.rawValue
        okButton.layer.cornerRadius = 5.0
        okButton.layer.borderWidth = 1.0
        okButton.layer.borderColor = UIColor.lightGray.cgColor
        okButton.layer.shadowColor = UIColor.darkGray.cgColor
        okButton.layer.shadowOpacity = 0.3
        okButton.layer.shadowOffset = CGSize.zero
        okButton.layer.shadowRadius = 2
    }
    
    func fillFields(forItem item: ItemViewModel) {
        self.item = item
        nameTextField.text = item.name
        descriptionTextField.text = item.description
    }

    //MARK: IBActions
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //Add item
    @IBAction func okDidTapped(_ sender: UIButton) {
        guard let name = nameTextField.text, let description = descriptionTextField.text, !description.isEmpty else {
            return
        }
        item.name = name
        item.description = description
        presenter.saveData(forItem: item)
    }
    
}
