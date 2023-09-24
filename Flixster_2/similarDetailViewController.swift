//
//  similarDetailViewController.swift
//  Flixster_2
//
//  Created by AJ Cardoza on 9/24/23.
//

import UIKit
import NukeExtensions



class similarDetailViewController: UIViewController {
    
    
    @IBOutlet weak var similarImage: UIImageView!
    @IBOutlet weak var similarOverview: UILabel!
    @IBOutlet weak var similarPopularity: UILabel!
    @IBOutlet weak var similarRelease: UILabel!
    @IBOutlet weak var similarTitle: UILabel!
    
    var selectedMovieID: Int?
    
    var similar: Similar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        similarTitle.text = similar.title
        similarRelease.text = similar.release_date
        similarOverview.text = similar.overview
        MovieData.shared.selectedMovieID = similar.id
        similarPopularity.text = String(format: "%.0f", similar.popularity)
        
        
        let baseUrl = "https://image.tmdb.org/t/p/w500"
        let imageUrlString = baseUrl + similar.poster_path
        
        if let imageUrl = URL(string: imageUrlString) {
            NukeExtensions.loadImage(with: imageUrl, into: similarImage)
        }
    }
}
