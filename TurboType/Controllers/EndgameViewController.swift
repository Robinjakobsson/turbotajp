//
//  EndgameViewController.swift
//  TurboType
//
//  Created by Robin jakobsson on 2025-03-25.
//
// hej
import UIKit

class EndgameViewController: UIViewController {

    @IBOutlet weak var scoreTextLabel: UILabel!
    
    
    var toGamePlayAgainSegue = "toGamePlayAgainSegue"
    
    var totalTime : Double?
    
    var homeScreenSegue = "homeScreenSegue"
    
    var score : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    
    
    

    @IBAction func playAgainButton(_ sender: UIButton) {
        
        
    }
    
    
    @IBAction func homeButton(_ sender: UIButton) {
        
    }
    
    
    @IBAction func highscoreButton(_ sender: UIButton) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == toGamePlayAgainSegue {
            
            let destinationVC = segue.destination as? GameplayViewController
            
            destinationVC?.totalTime = totalTime
        }
        
    }

}
