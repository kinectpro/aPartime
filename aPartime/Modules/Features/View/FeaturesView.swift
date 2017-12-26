//
//  FeaturesView.swift
//  aPartime
//
//  Created by den on 07/12/2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import UIKit

protocol FeaturesViewProtocol {
    func showFeatures(features: [FeatureViewModel])
}

class FeaturesView: UIViewController, UITableViewDelegate, UITableViewDataSource, FeaturesViewProtocol {

    @IBOutlet weak var featuresTableView: UITableView!
    
    var presenter: FeaturesPresenterProtocol!
    
    var features = [FeatureViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupViews()
        presenter.getAllFeatures()
    }
    
    func addViews() {
        let createBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createButtonDidTap))
        navigationItem.rightBarButtonItems = [createBarButtonItem]
    }
    
    func setupViews() {
        navigationController?.navigationBar.barTintColor = UIColor(red: 160 / 255, green: 190 / 255, blue: 100 / 255, alpha: 1.0)
    }
    
    @objc func createButtonDidTap() {
        presenter.createFeature()
    }
    
    //MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return features.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let feature = features[index]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeatureCell", for: indexPath) as! FeatureCell
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
        let feature = features[index]
        presenter.openTasks(forFeature: feature)
    }
    
    // MARK: FeaturesScreenViewControllerProtocol implementation
    func showFeatures(features: [FeatureViewModel]) {
        self.features = features
        featuresTableView.reloadData()
    }

}
