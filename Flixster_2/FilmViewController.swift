//
//  ViewController.swift
//  Flixster
//
//  Created by AJ Cardoza on 9/16/23.
//

import UIKit

class FilmViewController: UIViewController, UITableViewDataSource {
    
    var films: [Films] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        films = Films.horrorFilms
        print(films)
        
        tableView.dataSource = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO: Pt 1 - Pass the selected track to the detail view controller
        if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell),
           let filmDetailViewController = segue.destination as? filmDetailViewController {
            
            let films = films[indexPath.row]
            
            filmDetailViewController.films = films
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for: indexPath) as! FilmCell
        let films = films[indexPath.row]
        cell.configure(with: films)
        
        return cell
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }


}

