//
//  Upcoming.swift
//  Flixster_2
//
//  Created by AJ Cardoza on 9/20/23.
//
//

import Foundation
import Nuke

struct UpcomingResponse: Decodable {
    let results: [Upcoming]
}

struct Upcoming: Decodable {
    let poster_path: String
    let title: String
    let overview: String
    let release_date: String
    let id: Int
    let popularity: Double
  
    
}

