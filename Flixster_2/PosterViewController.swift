//
//  PosterViewController.swift
//  Flixster_2
//
//  Created by AJ Cardoza on 9/20/23.
//

import UIKit
import NukeExtensions
import Foundation


class PosterViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var posters: [Posters] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        
        // Do any additional setup after loading the view.
        let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=48f8d9be51fbdcd2b82b022650e1ec15")!
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            
            if let error = error {
                print(error as Any)
            }
            
            guard let data = data else {
                print("Data is nil")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let response = try decoder.decode(PosterResponse.self, from: data)
                let posters = response.results
                DispatchQueue.main.async {
                    self?.posters = posters
                    self?.collectionView.reloadData()
                }
                print("\(posters)")
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumInteritemSpacing = 1
        
        layout.minimumLineSpacing = 4
        
        let numberOfColumns: CGFloat = 3
        
        let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns
        
        layout.itemSize = CGSize(width: width, height: width * 1.5)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO: Pt 1 - Pass the selected track to the detail view controller

        // Get the cell that triggered the segue
        if let cell = sender as? UICollectionViewCell,
           // Get the index path of the cell from the table view
           let indexPath = collectionView.indexPath(for: cell),
           // Get the detail view controller
           let posterDetailViewController = segue.destination as? posterDetailViewController {

            // Use the index path to get the associated track
            let posters = posters[indexPath.row]

            // Set the track on the detail view controller
            posterDetailViewController.posters = posters
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        posters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        
        let poster = posters[indexPath.item]
        
        let baseUrl = "https://image.tmdb.org/t/p/w500" // Update with the appropriate base URL
        let imageUrlString = baseUrl + poster.poster_path
        
        if let imageUrl = URL(string: imageUrlString) {
            // Now, you can load the image using NukeExtensions
            NukeExtensions.loadImage(with: imageUrl, into: cell.posterImageView)
        } else {
            // Handle the case where imageUrlString is not a valid URL
            // You can set a placeholder image or take appropriate action here
        }
        
        return cell
    }
}

