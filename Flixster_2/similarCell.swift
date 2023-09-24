//
//  similarViewCell.swift
//  Flixster_2
//
//  Created by AJ Cardoza on 9/22/23.
//

import UIKit
import NukeExtensions

class similarCell: UITableViewCell {
    
   
    @IBOutlet weak var similarImageView: UIImageView!
    @IBOutlet weak var similarTitle: UILabel!
    @IBOutlet weak var similarRelease: UILabel!
    @IBOutlet weak var similarOverview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

        // Configure the view for the selected state
        
    func configure(with similar: Similar) {
        similarTitle.text = similar.title
        similarRelease.text = similar.release_date
        similarOverview.text = similar.overview
            
        
    let baseUrl = "https://image.tmdb.org/t/p/w500" // Update with the appropriate base URL
    let imageUrlString = baseUrl + similar.poster_path
    
    if let imageUrl = URL(string: imageUrlString) {
        // Now, you can load the image using NukeExtensions
        NukeExtensions.loadImage(with: imageUrl, into: similarImageView)
    }
    
        
    }

}
