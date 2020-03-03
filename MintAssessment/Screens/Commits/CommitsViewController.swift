//
//  CommitsViewController.swift
//  MintAssessment
//
//  Created by Oluwatobi Omotayo on 03/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import UIKit

class CommitsViewController: UITableViewController {
    
    var viewModel: CommitsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = viewModel.title
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60.0
        
        viewModel.commitsDidChange = { [unowned self] _, message in
            DispatchQueue.main.async {
                if let message = message {
                    self.showAlert(title: "Error", message: message)
                    return
                }
                
                self.tableView.reloadData()
            }
        }
    }
    
}

extension CommitsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCommits()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommitCellId", for: indexPath)
        
        if let cellViewModel = viewModel.viewModelForCommit(at: indexPath) {
            cell.textLabel?.text = cellViewModel.message
            cell.detailTextLabel?.text = "\(cellViewModel.authorName) - \(cellViewModel.authorEmail)"
        }
        
        return cell
    }
}

