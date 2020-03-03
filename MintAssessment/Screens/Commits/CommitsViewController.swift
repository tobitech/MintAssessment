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
    }
    
}

extension CommitsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCommits()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommitCellId", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}

