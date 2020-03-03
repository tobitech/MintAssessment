//
//  Models.swift
//  MintAssessment
//
//  Created by Oluwatobi Omotayo on 03/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import Foundation

struct SearchRepoResponse: Decodable {
    let total_count: Int
    let items: [Repo]
}

struct Repo: Decodable {
    let id: Int?
    let name: String?
    let full_name: String?
    let owner: Owner?
}

struct Owner: Decodable {
    let id: Int?
    let login: String
}

