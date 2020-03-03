//
//  FindReposViewController.swift
//  MintAssessment
//
//  Created by Oluwatobi Omotayo on 03/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import UIKit

class FindReposViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var viewModel: FindReposViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = FindReposViewModel()
        
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.reposDidChange = { [unowned self] _ in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        searchBar.becomeFirstResponder()
    }
}

extension FindReposViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        viewModel.query = searchBar.text ?? ""
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        viewModel.query = searchBar.text ?? ""
    }
}

extension FindReposViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRepos()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCellId", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    
}

