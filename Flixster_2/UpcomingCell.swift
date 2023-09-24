//
//  UpcomingCell.swift
//  Flixster_2
//
//  Created by AJ Cardoza on 9/20/23.
//

import UIKit
import NukeExtensions

class UpcomingCell: UITableViewCell {
    
   
    @IBOutlet weak var upcomingImageView: UIImageView!
    @IBOutlet weak var upcomingTitle: UILabel!
    @IBOutlet weak var upcomingRelease: UILabel!
    @IBOutlet weak var upcomingOverview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

        // Configure the view for the selected state
        
    func configure(with upcoming: Upcoming) {
        upcomingTitle.text = upcoming.title
        upcomingRelease.text = upcoming.release_date
        upcomingOverview.text = upcoming.overview
            
        
    let baseUrl = "https://image.tmdb.org/t/p/w500" // Update with the appropriate base URL
    let imageUrlString = baseUrl + upcoming.poster_path
    
    if let imageUrl = URL(string: imageUrlString) {
        // Now, you can load the image using NukeExtensions
        NukeExtensions.loadImage(with: imageUrl, into: upcomingImageView)
    }
    
        
    }

}

