//
//  PlayingCell.swift
//  Flixster_2
//
//  Created by AJ Cardoza on 9/20/23.
//
import UIKit
import NukeExtensions

class PlayingCell: UITableViewCell {
    
    @IBOutlet weak var filmImageView: UIImageView!
    @IBOutlet weak var filmNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

        // Configure the view for the selected state
        
    func configure(with playing: Playing) {
        filmNameLabel.text = playing.title
        releaseDateLabel.text = playing.release_date
        overviewLabel.text = playing.overview
            
        let baseUrl = "https://image.tmdb.org/t/p/w500" // Update with the appropriate base URL
        let imageUrlString = baseUrl + playing.poster_path
        
        if let imageUrl = URL(string: imageUrlString) {
            // Now, you can load the image using NukeExtensions
            NukeExtensions.loadImage(with: imageUrl, into: filmImageView)
        }
        
    }

}
