//
//  NetworkService.swift
//  MintAssessment
//
//  Created by Oluwatobi Omotayo on 03/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case network(Error)
    case invalidData
}

class NetworkService {
    
    let urlSession = URLSession.shared
    
    func findRepositories(with query: String, completion: @escaping ([Repo]?, Error?) -> ()) {
        request(.search(matching: query)) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(SearchRepoResponse.self, from: data)
                    completion(response.items, nil)
                } catch let jsonError {
                    print(jsonError)
                    completion(nil, jsonError)
                }
            case .failure(let error):
                print("failed")
                completion(nil, error)
            }
        }
    }
    
    func request(_ endpoint: Endpoint, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = endpoint.url else {
            return completion(.failure(NetworkError.invalidURL))
        }
        
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                return completion(.failure(NetworkError.network(error)))
            }
            
            guard let data = data else {
                return completion(.failure(NetworkError.invalidData))
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
    
}
