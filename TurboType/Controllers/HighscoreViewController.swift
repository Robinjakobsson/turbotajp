//
//  HighscoreViewController.swift
//  TurboType
//
//  Created by Robin jakobsson on 2025-03-25.
//

import UIKit

class HighscoreViewController: UIViewController {
    
    var scores : [HighScore] = []

    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        getHighScores()
        
        
    }
    
    
    func getHighScores() {
        let userDefaults = UserDefaults.standard
        let highScores = userDefaults.array(forKey: "highScores") as? [[String: Any]] ?? []
        
       scores = highScores.map { score in
            HighScore(
                points: score["points"] as? Int ?? 0,
                language: score["language"] as? String ?? "English",
                difficulty: score["difficulty"] as? String ?? "Easy"
            )
        }
        tableView.reloadData()
    }
}

extension HighscoreViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        let score = scores[indexPath.row]
        cell.customImageView.image = UIImage(systemName: "crown")
        cell.customLabel.text = "\(indexPath.row + 1). \(score.points) - \(score.language) - \(score.difficulty)"
        
        switch indexPath.row {
        case 0:
            cell.customImageView.image = UIImage(named: "Crown")
        case 1:
            cell.customImageView.image = UIImage(named: "Crown.silver")
        case 2:
            cell.customImageView.image = UIImage(named: "Crown.copper")
            
        default:
            cell.customImageView.image = UIImage(systemName: "person")
        }

        
        return cell
    }
    
    
}


