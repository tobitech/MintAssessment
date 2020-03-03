//
//  ReposViewModel.swift
//  MintAssessment
//
//  Created by Oluwatobi Omotayo on 03/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import Foundation

class ReposViewModel {
    
    var query: String = "" {
        didSet {
            findRepositories(with: query)
        }
    }

    var reposDidChange: (([Repo]) -> Void)?
    
    var repos = [Repo]() {
        didSet {
            reposDidChange?(repos)
        }
    }
    
    let service: NetworkService
    
    init(service: NetworkService = NetworkService()) {
        self.service = service
    }
    
    func findRepositories(with query: String) {
        service.request(.search(matching: query)) {[weak self] result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
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
    
}
