//
//  Models.swift
//  MintAssessment
//
//  Created by Oluwatobi Omotayo on 03/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import Foundation

struct Repo: Decodable {
    let id: Int?
    let full_name: String?
}

struct SearchRepoResponse: Decodable {
    let total_count: Int
    let items: [Repo]
}
