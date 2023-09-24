//
//  PlayingViewController.swift
//  Flixster_2
//
//  Created by AJ Cardoza on 9/20/23.
//

import Foundation
import UIKit
import Nuke


class PlayingViewController: UIViewController, UITableViewDataSource {
    
    var playing: [Playing] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedMovieID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=48f8d9be51fbdcd2b82b022650e1ec15")!
        
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
                
                let dateFormatter = DateFormatter()
                
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                
                let response = try decoder.decode(PlayingResponse.self, from: data)
                
                let playing = response.results
                DispatchQueue.main.async {
                    self?.playing = playing
                    
                    self?.tableView.reloadData()
                }
                
                print("\(playing)")
            }
            catch {
                print("Error parsing JSON: \(error.localizedDescription)")
            }
        }

        print(playing)
        task.resume()
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // TODO: Deselect any selected table view rows

        // Get the index path for the current selected table view row (if exists)
        if let indexPath = tableView.indexPathForSelectedRow {

            // Deslect the row at the corresponding index path
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO: Pt 1 - Pass the selected track to the detail view controller

        // Get the cell that triggered the segue
        if let cell = sender as? UITableViewCell,
           // Get the index path of the cell from the table view
           let indexPath = tableView.indexPath(for: cell),
           // Get the detail view controller
           let playingDetailViewController = segue.destination as? playingDetailViewController {

            // Use the index path to get the associated track
            let playing = playing[indexPath.row]

            // Set the track on the detail view controller
            playingDetailViewController.playing = playing
          
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playing.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayingCell", for: indexPath) as! PlayingCell
        
        // Get the track that corresponds to the table view row
        let playing = playing[indexPath.row]
        
        // Configure the cell with it's associated track
        cell.configure(with: playing)
        
        // return the cell for display in the table view
        return cell
    }
}

