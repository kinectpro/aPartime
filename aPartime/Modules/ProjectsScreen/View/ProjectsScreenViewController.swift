//
//  ProjectsScreenViewController.swift
//  aPartime
//
//  Created by Sergey Kobzin on 05.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import UIKit

class ProjectsScreenViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    var data = [Project]()
    var projectsScreenPresenter: ProjectsScreenPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        ProjectsScreenConfigurator.setupDependencies(projectsScreenViewController: self)
        
        //data = projectsScreenPresenter.getAllProjects()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        projectsScreenPresenter.getAllProjects(success: { (projects) in
            self.data = projects
            self.tableView.reloadData()
        }, fail: {})
    }
    
    //MARK: IBActions
    @IBAction func addNewTapped(_ sender: UIButton) {
        projectsScreenPresenter.createNewProject()
    }
    
    //MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ProjectCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ProjectCell
        
        guard let nameProject = data[indexPath.row].name, !nameProject.isEmpty else {return cell}
        guard let descriptionProject = data[indexPath.row].descriptionProject, !nameProject.isEmpty else {return cell}
        cell.projectNameLabel.text = nameProject
        cell.editTappedHandler = {
            self.projectsScreenPresenter.editProject(name: nameProject, description: descriptionProject)
        }
        
        
        return cell
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! ProjectCell
        if let nameProject = cell.projectNameLabel.text {
            projectsScreenPresenter.openFeaturesFor(project: nameProject)
        }
        
    }
}
