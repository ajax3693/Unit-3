//
//  Playing.swift
//  Flixster_2
//
//  Created by AJ Cardoza on 9/20/23.
//

import Foundation
import Nuke

struct PlayingResponse: Decodable {
    let results: [Playing]
}

struct Playing: Decodable {
    let title: String
    let overview: String
    let release_date: String
    let poster_path: String
    let id: Int
    let popularity: Double
}


