//
//  similarViewController.swift
//  Flixster_2
//
//  Created by AJ Cardoza on 9/22/23.
//

import UIKit

class MovieData {
    static let shared = MovieData()
    var selectedMovieID: Int?
}

class similarViewController: UIViewController, UITableViewDataSource {

    var similar: [Similar] = []
    
    var selectedMovie: Int?

    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let selectedMovieID = MovieData.shared.selectedMovieID {
            let url = URL(string: "https://api.themoviedb.org/3/movie/\(selectedMovieID)/similar?api_key=48f8d9be51fbdcd2b82b022650e1ec15")!
            
            
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
                    
                    let response = try decoder.decode(SimilarResponse.self, from: data)
                    
                    let similar = response.results
                    DispatchQueue.main.async {
                        self?.similar = similar
                        self?.tableView.reloadData()
                    }
                    
                    print("\(similar)")
                }
                catch {
                    print("error parsin JSON: \(error.localizedDescription)")
                }
            }
            
            print(similar)
            task.resume()
            tableView.dataSource = self
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
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
           let similarDetailViewController = segue.destination as? similarDetailViewController {

            // Use the index path to get the associated track
            let similar = similar[indexPath.row]

            // Set the track on the detail view controller
            similarDetailViewController.similar = similar
          
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return similar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "similarCell", for: indexPath) as! similarCell
        
        let similar = similar[indexPath.row]
        
        cell.configure(with: similar)
        
        return cell
    }

}

