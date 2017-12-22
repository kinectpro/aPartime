//
//  ProjectsViewController.swift
//  aPartime
//
//  Created by Sergey Kobzin on 05.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import UIKit

protocol ProjectsViewControllerProtocol {
    func showProjects(projects: [ProjectViewModel])
}

class ProjectsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ProjectsViewControllerProtocol {
    
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var projectsTableView: UITableView!
    
    var presenter: ProjectsPresenter!
    
    var projects = [ProjectViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        if index == 0 {
            cell.topConstraint.constant = 8.0
        }
        if index == projects.count - 1 {
            cell.bottomConstraint.constant = 8.0
        }
        let project = projects[index]
        cell.projectNameLabel.text = project.name
        cell.editTappedHandler = {
            self.presenter.editProject(project: project)
        }
        return cell
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        let project = projects[index]
        presenter.openFeatures(forProject: project)
    }
    
    func showProjects(projects: [ProjectViewModel]) {
        self.projects = projects
        projectsTableView.reloadData()
    }
}
