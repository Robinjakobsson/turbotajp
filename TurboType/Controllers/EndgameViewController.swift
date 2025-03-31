//
//  EndgameViewController.swift
//  TurboType
//
//  Created by Robin jakobsson on 2025-03-25.
//
// hej
import UIKit
import AVFoundation

class EndgameViewController: UIViewController {

    @IBOutlet weak var scoreTextLabel: UILabel!
    var endGameSound: AVAudioPlayer?
    var toGamePlayAgainSegue = "toGamePlayAgainSegue"
    var totalTime : Double?
    var homeScreenSegue = "homeScreenSegue"
    var score : Int?
    var language : String?
    
    var scores : [HighScore] = []
    
    @IBOutlet weak var currentHighscore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        SoundManager.shared.endGameMusic(forResource: "endGame")
        showConfetti()
       

        if let totalScore = score {
            let scoreString = String(totalScore)
            scoreTextLabel.text = scoreString
            
            
            let userDefaults = UserDefaults.standard
            let highScores = userDefaults.array(forKey: "highScores") as? [[String: Any]] ?? []
            
            let highscore = highScores.map { score in
                HighScore(
                    points: score["points"] as? Int ?? 0,
                    language: score["language"] as? String ?? "English",
                    difficulty: score["difficulty"] as? String ?? "Easy"
                )
            }
            
            let highscoreText = highscore.map { "\($0.points)" }.joined(separator: "\n")
            
            currentHighscore.text = "Current highscore: \(highscoreText)"
            
        }
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
            destinationVC?.language = language
        }
    }
    
    func showConfetti() {
        let confettiLayer = CAEmitterLayer()
        confettiLayer.emitterPosition = CGPoint(x: view.bounds.width / 2, y: -10)
        confettiLayer.emitterShape = .line
        confettiLayer.emitterSize = CGSize(width: view.bounds.width, height: 1)
            
        let colors: [UIColor] = [.red, .blue, .yellow, .green, .orange, .purple]
        
        let cells: [CAEmitterCell] = colors.map { color in
            let cell = CAEmitterCell()
            cell.birthRate = 5
            cell.lifetime = 10.0
            cell.velocity = CGFloat.random(in: 100...200)
            cell.velocityRange = 50
            cell.emissionLongitude = .pi
            cell.emissionRange = .pi / 4
            cell.spin = 3.5
            cell.spinRange = 1.0
            cell.scale = 0.1
            cell.scaleRange = 0.02
            cell.color = color.cgColor
            cell.contents = UIImage(systemName: "circle.fill")?.cgImage
            return cell
        }
            
        confettiLayer.emitterCells = cells
        view.layer.addSublayer(confettiLayer)
            
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            confettiLayer.birthRate = 0
        }
    }


}
