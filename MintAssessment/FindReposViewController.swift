//
//  FindReposViewController.swift
//  MintAssessment
//
//  Created by Oluwatobi Omotayo on 03/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import UIKit

class FindReposViewController: UIViewController {
    
    let viewModel = ReposViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = "Welcome to a new app!"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        findRepo()
    }

    func findRepo() {
        viewModel.findRepositories(with: "rails") { repos, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            print(repos?.count ?? 0)
        }
    }

}

