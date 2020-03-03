//
//  CommitsViewModel.swift
//  MintAssessment
//
//  Created by Oluwatobi Omotayo on 03/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import Foundation

class CommitsViewModel {
    
    // MARK: Properties
    let service: NetworkService
    let repo: Repo
    var commitsDidChange: (([Commit]) -> Void)?
    
    var commits = [Commit]() {
        didSet {
            commitsDidChange?(commits)
        }
    }
    
    // MARK: Init
    init(service: NetworkService = NetworkService(), repo: Repo) {
        self.service = service
        self.repo = repo
    }
    
    // MARK: Helpers
    
    private func listCommits() {
        service.request(.listCommits(for: repo)) {[weak self] result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode([CommitData].self, from: data)
                    self?.commits = response.compactMap { $0.commit }
                } catch let jsonError {
                    print(jsonError.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func numberOfCommits() -> Int {
        return commits.count
    }
    
}