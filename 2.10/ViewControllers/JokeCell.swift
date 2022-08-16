//
//  JokeCell.swift
//  2.10
//
//  Created by Александр on 12.08.2022.
//

import UIKit

class JokeCell: UITableViewCell {

    @IBOutlet var setUpLabel: UILabel!
    @IBOutlet var punchlineLabel: UILabel!
    @IBOutlet var pepeImage: UIImageView!
    
    func configure(with joke: Joke) {
        setUpLabel.text = joke.setup
        punchlineLabel.text = joke.delivery ?? ""
        pepeImage.image = UIImage(named: "pepe")
    }
}
