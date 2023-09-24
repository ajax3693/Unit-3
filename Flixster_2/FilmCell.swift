//
//  FilmCell.swift
//  Flixster
//
//  Created by AJ Cardoza on 9/16/23.
//

import UIKit
import Nuke
import NukeExtensions

class FilmCell: UITableViewCell {

    @IBOutlet weak var filmImageView: UIImageView!
    @IBOutlet weak var filmNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var shortOverviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

        // Configure the view for the selected state
        
    func configure(with films: Films) {
        filmNameLabel.text = films.title
        releaseDateLabel.text = films.release_date
        shortOverviewLabel.text = films.shortOverview
            
        NukeExtensions.loadImage(with: films.poster_path, into: filmImageView)
        
    }

}
