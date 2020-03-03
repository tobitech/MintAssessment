//
//  Commit.swift
//  MintAssessment
//
//  Created by Oluwatobi Omotayo on 03/03/2020.
//  Copyright © 2020 Oluwatobi Omotayo. All rights reserved.
//

import Foundation

struct CommitData: Decodable {
    let commit: Commit?
}

struct Commit: Decodable {
    let message: String?
    let author: Author?
}

struct Author: Decodable {
    let name: String?
    let email: String?
}
