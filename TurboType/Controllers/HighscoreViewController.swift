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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let score = scores[indexPath.row]
        cell.textLabel?.text = String(score)
        
        return cell
    }
    
    
}


