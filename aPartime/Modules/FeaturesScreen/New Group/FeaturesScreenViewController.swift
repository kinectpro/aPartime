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
    var data = [String]()
    var featuresScreenPresenter: FeaturesScreenPresenterProtocol!
    var project = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FeaturesScreenConfigurator.setupDependencies(featuresScreenViewController: self)
        
        data = featuresScreenPresenter.getAllFeatures()
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
        
        cell.nameLabel.text = data[indexPath.row]
        
        return cell
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! FeatureCell
        if let name = cell.nameLabel.text {
            featuresScreenPresenter.editFeature(name: name)
        }
        
    }

}
