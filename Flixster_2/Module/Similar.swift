//
//  Similar.swift
//  Flixster_2
//
//  Created by AJ Cardoza on 9/22/23.
//

import Foundation
import Nuke

struct SimilarResponse: Decodable {
    let results: [Similar]
}

struct Similar: Decodable {
    let title: String
    let overview: String
    let release_date: String
    let poster_path: String
    let id: Int
    let popularity: Double
    
}
