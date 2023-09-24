//
//  playingDetailViewController.swift
//  Flixster_2
//
//  Created by AJ Cardoza on 9/20/23.
//

import UIKit
import NukeExtensions



class playingDetailViewController: UIViewController {
    
    
    @IBOutlet weak var playingPopularity: UILabel!
    @IBOutlet weak var playingImage: UIImageView!
    @IBOutlet weak var playingTitle: UILabel!
    @IBOutlet weak var playingRelease: UILabel!
    @IBOutlet weak var playingOverview: UILabel!
    
    var selectedMovieID: Int?
    
    var playing: Playing!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playingTitle.text = playing.title
        playingRelease.text = playing.release_date
        playingOverview.text = playing.overview
        MovieData.shared.selectedMovieID = playing.id
        playingPopularity.text = String(format: "%.0f", playing.popularity)
        
        
        let baseUrl = "https://image.tmdb.org/t/p/w500"
        let imageUrlString = baseUrl + playing.poster_path
        
        if let imageUrl = URL(string: imageUrlString) {
            NukeExtensions.loadImage(with: imageUrl, into: playingImage)
        }
    }
}






