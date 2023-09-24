//
//  UpcomingDetailViewController.swift
//  Flixster_2
//
//  Created by AJ Cardoza on 9/20/23.
//

import UIKit
import NukeExtensions

class upcomingDetailViewController: UIViewController {

    weak var upcomingViewController: UpcomingViewController?

    @IBOutlet weak var upcomingPopularity: UILabel!
    @IBOutlet weak var upcomingImageView: UIImageView!
    @IBOutlet weak var upcomingTitle: UILabel!
    @IBOutlet weak var upcomingRelease: UILabel!
    @IBOutlet weak var upcomingOverview: UILabel!
    @IBOutlet weak var upcomingRunTime: UILabel!
    
    var upcoming: Upcoming!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upcomingTitle.text = upcoming.title
        upcomingRelease.text = upcoming.release_date
        upcomingOverview.text = upcoming.overview
        MovieData.shared.selectedMovieID = upcoming.id
        upcomingPopularity.text = String(format: "%.0f", upcoming.popularity)

        
        
        let baseUrl = "https://image.tmdb.org/t/p/w500" // Update with the appropriate base URL
        let imageUrlString = baseUrl + upcoming.poster_path

        if let imageUrl = URL(string: imageUrlString) {
            NukeExtensions.loadImage(with: imageUrl, into: upcomingImageView)
        }
        
    }
}


