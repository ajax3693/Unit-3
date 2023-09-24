//
//  posterDetailViewController.swift
//  Flixster_2
//
//  Created by AJ Cardoza on 9/22/23.
//

import UIKit
import NukeExtensions

class posterDetailViewController: UIViewController {
    
    @IBOutlet weak var posterPopularity: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var posterOverview: UILabel!
    @IBOutlet weak var posterRelease: UILabel!
    @IBOutlet weak var posterTitle: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    
    var posters: Posters!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        posterTitle.text = posters.title
        posterRelease.text = posters.release_date
        posterOverview.text = posters.overview
        MovieData.shared.selectedMovieID = posters.id
        posterPopularity.text = String(format: "%.0f", posters.popularity)

        
        
        let baseUrl = "https://image.tmdb.org/t/p/w500" // Update with the appropriate base URL
        let imageUrlString = baseUrl + posters.poster_path

        if let imageUrl = URL(string: imageUrlString) {
            NukeExtensions.loadImage(with: imageUrl, into: posterImage)
        }
        
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
