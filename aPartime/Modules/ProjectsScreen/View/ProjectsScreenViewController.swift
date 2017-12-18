//
//  ProjectsScreenViewController.swift
//  aPartime
//
//  Created by Sergey Kobzin on 05.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import UIKit

protocol ProjectsScreenViewControllerProtocol {
    func showProjects(projects: [ProjectViewModel])
}

class ProjectsScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ProjectsScreenViewControllerProtocol {
    
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var projectsTableView: UITableView!
    
    var presenter: ProjectsScreenPresenter!
    
    var projects = [ProjectViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProjectsScreenConfigurator.setupDependencies(viewController: self)
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getAllProjects()
    }
    
    func setupViews() {
        navigationBarView.layer.shadowColor = UIColor.darkGray.cgColor
        navigationBarView.layer.shadowOpacity = 0.6
        navigationBarView.layer.shadowOffset = CGSize.zero
        navigationBarView.layer.shadowRadius = 4
    }
    
    //MARK: IBActions
    @IBAction func addNewTapped(_ sender: UIButton) {
        presenter.createNewProject()
    }
    
    //MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath) as! ProjectCell
        let project = projects[index]
        if index == 0 {
            cell.topConstraint.constant = 8.0
        }
        if index == projects.count - 1 {
            cell.bottomConstraint.constant = 8.0
        }
        cell.projectNameLabel.text = project.name
        cell.editTappedHandler = {
            self.presenter.editProject(project: project)
        }
        return cell
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        presenter.openFeaturesFor(project: projects[index])
    }
    
    func showProjects(projects: [ProjectViewModel]) {
        self.projects = projects
        projectsTableView.reloadData()
    }
}
