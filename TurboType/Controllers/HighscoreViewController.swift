//
//  HighscoreViewController.swift
//  TurboType
//
//  Created by Robin jakobsson on 2025-03-25.
//

import UIKit

class HighscoreViewController: UIViewController {
    
    var scores : [Int] = []

    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        loadUserDefaults()
        
        
    }
    
    
    func loadUserDefaults() {
        let userDefaults = UserDefaults.standard
        scores = userDefaults.array(forKey: "highScores") as? [Int] ?? []
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
        cell.customLabel.text = String("\(indexPath.row) : \(score)")
        
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


