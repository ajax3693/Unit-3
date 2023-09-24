//
//  Posters.swift
//  Flixster_2
//
//  Created by AJ Cardoza on 9/20/23.
//

import Foundation
import Nuke

struct PosterResponse: Decodable {
    let results: [Posters]
}

struct Posters: Decodable {
    var poster_path: String
    let title: String
    let overview: String
    let release_date: String
    let id: Int
    let popularity: Double
}
