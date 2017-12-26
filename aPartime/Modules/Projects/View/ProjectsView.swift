//
//  ProjectsView.swift
//  aPartime
//
//  Created by Sergey Kobzin on 05.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import UIKit

protocol ProjectsViewProtocol {
    func showProjects(projects: [ProjectViewModel])
}

class ProjectsView: UIViewController, UITableViewDelegate, UITableViewDataSource, ProjectsViewProtocol {
    
    @IBOutlet weak var projectsTableView: UITableView!
    
    var presenter: ProjectsPresenter!
    
    var projects = [ProjectViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupViews()
        presenter.getAllProjects()
    }
    
    func addViews() {
        let createBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createButtonDidTap))
        let exportBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(exportButtonDidTap))
        navigationItem.rightBarButtonItems = [createBarButtonItem, exportBarButtonItem]
    }
    
    func setupViews() {
        navigationController?.navigationBar.barTintColor = UIColor(red: 100 / 255, green: 160 / 255, blue: 190 / 255, alpha: 1.0)
    }
    
    @objc func exportButtonDidTap() {
        
    }
    
    @objc func createButtonDidTap() {
        presenter.createProject()
    }
    
    //MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let project = projects[index]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath) as! ProjectCell
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
        let project = projects[index]
        presenter.openFeatures(forProject: project)
    }
    
    func showProjects(projects: [ProjectViewModel]) {
        self.projects = projects
        projectsTableView.reloadData()
    }
}
