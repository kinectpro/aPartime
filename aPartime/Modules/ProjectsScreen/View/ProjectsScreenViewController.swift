//
//  ProjectsScreenViewController.swift
//  aPartime
//
//  Created by Sergey Kobzin on 05.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import UIKit

protocol ProjectsScreenViewControllerProtocol {
    func showProjects(projects: [String])
}

class ProjectsScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ProjectsScreenViewControllerProtocol {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var projectsTableView: UITableView!
    
    var presenter: ProjectsScreenPresenter!
    
    var projects = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProjectsScreenConfigurator.setupDependencies(viewController: self)
        presenter.getAllProjects()
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
        let cellIdentifier = "ProjectCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ProjectCell
        
        let project = projects[indexPath.row]
        cell.projectNameLabel.text = project
        cell.editTappedHandler = {
            self.presenter.editProject(name: project)
        }
        
        
        return cell
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! ProjectCell
        if let nameProject = cell.projectNameLabel.text {
            presenter.openFeaturesFor(project: nameProject)
        }
        
    }
    
    func showProjects(projects: [String]) {
        self.projects = projects
        projectsTableView.reloadData()
    }
}
