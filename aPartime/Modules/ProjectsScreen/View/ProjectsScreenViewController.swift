//
//  ProjectsScreenViewController.swift
//  aPartime
//
//  Created by Sergey Kobzin on 05.12.2017.
//  Copyright © 2017 kinectpro. All rights reserved.
//

import UIKit

class ProjectsScreenViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var data = [String]()
    var projectsScreenPresenter: ProjectsScreenPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        ProjectsScreenConfigurator.setupDependencies(projectsScreenViewController: self)
        
        data = projectsScreenPresenter.getAllProjects()
    }

    //MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ProjectCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ProjectCell
        
        cell.projectNameLabel.text = data[indexPath.row]
        
        return cell
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! ProjectCell
        if let nameProject = cell.projectNameLabel.text {
            projectsScreenPresenter.editProject(name: nameProject)
        }
        
    }
}
