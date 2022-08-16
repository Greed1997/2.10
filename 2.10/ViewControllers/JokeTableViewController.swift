//
//  JokeTableViewController.swift
//  2.10
//
//  Created by Александр on 12.08.2022.
//

import UIKit

class JokeTableViewController: UITableViewController {

    private var joke: Joke!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 100
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        [joke].count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jokeCell", for: indexPath) as! JokeCell
        NetworkManager.shared.fetchJoke(from: linkJoke) { result in
            switch result {
            case .success(let joke):
                cell.configure(with: joke)
            case .failure(let networkError):
                print(networkError.rawValue)
            }
        }
        return cell
    }
    
}

