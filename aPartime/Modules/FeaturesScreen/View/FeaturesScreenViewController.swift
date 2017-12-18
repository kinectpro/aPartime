//
//  FeaturesScreenViewController.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import UIKit

protocol FeaturesScreenViewControllerProtocol {
    func showFeatures(features: [FeatureViewModel])
}

class FeaturesScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FeaturesScreenViewControllerProtocol {

    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var featuresTableView: UITableView!
    
    var presenter: FeaturesScreenPresenterProtocol!
    
    var features = [FeatureViewModel]()
    var project = Project()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FeaturesScreenConfigurator.setupDependencies(viewController: self)
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getAllFeatures(inProject: project)
    }
    
    func setupViews() {
        navigationBarView.layer.shadowColor = UIColor.darkGray.cgColor
        navigationBarView.layer.shadowOpacity = 0.6
        navigationBarView.layer.shadowOffset = CGSize.zero
        navigationBarView.layer.shadowRadius = 4
    }
    
    //MARK: IBActions
    @IBAction func addNewTapped(_ sender: UIButton) {
        presenter.createNewFeature()
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return features.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeatureCell", for: indexPath) as! FeatureCell
        let feature = features[index]
        if index == 0 {
            cell.topConstraint.constant = 8.0
        }
        if index == features.count - 1 {
            cell.bottomConstraint.constant = 8.0
        }
        cell.nameLabel.text = feature.name
        cell.editTappedHandler = {
            self.presenter.editFeature(feature: feature)
        }
        return cell
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        presenter.openTasksFor(feature: features[index])
    }
    
    // MARK: FeaturesScreenViewControllerProtocol implementation
    func showFeatures(features: [FeatureViewModel]) {
        self.features = features
        featuresTableView.reloadData()
    }

}
