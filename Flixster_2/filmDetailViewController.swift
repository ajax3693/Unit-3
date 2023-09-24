//
//  filmDetailViewController.swift
//  Flixster
//
//  Created by AJ Cardoza on 9/17/23.
//

import UIKit
import Nuke
import NukeExtensions

class filmDetailViewController: UIViewController {

    @IBOutlet weak var filmTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var runTimeLabel: UILabel!
    
    @IBOutlet weak var filmImageView: UIImageView!
    
    var films: Films!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmTitleLabel.text = films.title
        releaseDateLabel.text = films.release_date
        genreLabel.text = films.genre
        overviewLabel.text = films.overview
        runTimeLabel.text = films.runTime
        
        NukeExtensions.loadImage(with: films.poster_path, into: filmImageView)
        
    }

}
