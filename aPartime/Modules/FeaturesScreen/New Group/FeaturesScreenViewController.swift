//
//  FeaturesScreenViewController.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import UIKit

class FeaturesScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var data = [Feature]()
    var featuresScreenPresenter: FeaturesScreenPresenterProtocol!
    var project = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FeaturesScreenConfigurator.setupDependencies(featuresScreenViewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        featuresScreenPresenter.getAllFeatures(projectName: project, success: { (features) in
            self.data = features
            self.tableView.reloadData()
        }, fail: {
        })
    }
    
    //MARK: IBActions
    @IBAction func addNewTapped(_ sender: UIButton) {
        featuresScreenPresenter.createNewFeature()
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "FeatureCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! FeatureCell
        guard let name = data[indexPath.row].name, !name.isEmpty else {return cell}
        guard let descriptionFeature = data[indexPath.row].descriptionFeature, !descriptionFeature.isEmpty else {return cell}
        cell.nameLabel.text = name
        cell.editTappedHandler = {
            self.featuresScreenPresenter.editFeature(name: name, description: descriptionFeature)
        }
        return cell
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! FeatureCell
        guard let name = cell.nameLabel.text, !name.isEmpty else {return}
        //featuresScreenPresenter.editFeature(name: name, description: "Some feature description")
        
        
    }

}
