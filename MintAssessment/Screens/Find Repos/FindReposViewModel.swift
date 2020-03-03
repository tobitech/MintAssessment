//
//  ReposViewModel.swift
//  MintAssessment
//
//  Created by Oluwatobi Omotayo on 03/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import Foundation

class FindReposViewModel {
    
    // MARK: Properties
    var query: String = "" {
        didSet {
            findRepositories(with: query.lowercased())
        }
    }

    var reposDidChange: (([Repo]) -> Void)?
    
    private var repos = [Repo]() {
        didSet {
            reposDidChange?(repos)
        }
    }
    
    private let service: NetworkService
    
    // MARK: Init
    init(service: NetworkService = NetworkService()) {
        self.service = service
    }
    
    // MARK: Helpers
    private func findRepositories(with query: String) {
        service.request(.search(matching: query)) {[weak self] result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(SearchRepoResponse.self, from: data)
                    self?.repos = response.items
                } catch let jsonError {
                    print(jsonError.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func numberOfRepos() -> Int {
        return repos.count
    }
    
    func repo(at index: Int) -> Repo? {
        guard index < repos.count else {
            return nil
        }
        
        return repos[index]
    }
    
    func viewModelForRepo(at indexPath: IndexPath) -> RepoCellViewModel? {
        guard let repo = repo(at: indexPath.row) else {
            return nil
        }
        
        return RepoCellViewModel(repoName: repo.full_name ?? "")
    }
    
}
