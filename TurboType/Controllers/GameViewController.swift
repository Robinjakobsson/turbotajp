//
//  GameplayViewController.swift
//  TurboType
//
//  Created by Robin jakobsson on 2025-03-25.
//

import UIKit

class GameplayViewController: UIViewController, UITextFieldDelegate{
    
    var wordManager = WordManager()
    

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var passButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var secondsLeftLabel: UILabel!
    @IBOutlet weak var timerView: UIProgressView!
    
    let totalTime : Double = 60.0
    var elapsedTime : Double = 0.0
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.returnKeyType = .done // Sätt Return-knappen till "Done"
        textField.delegate = self // Sätt delegaten
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return knappen trycktes i tangentbordet")
        return true
    }

    
    @IBAction func passButtonPressed(_ sender: Any) {
    }
    
    
    @IBAction func startButton(_ sender: Any) {
        updateUI()
        textField.becomeFirstResponder()
    }
    
    
    func startTimer() {
        let interval = 0.1
        
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
            self.elapsedTime += interval
            let progress = Float(self.elapsedTime / self.totalTime)
            self.timerView.setProgress(progress, animated: true)
            
            if self.elapsedTime >= self.totalTime {
                timer.invalidate()
            }
        }
        
    }
    
    func updateUI() {
        textField.isHidden = false
        wordLabel.isHidden = false
        pointsLabel.isHidden = false
        secondsLeftLabel.isHidden = false
        timerView.isHidden = false
        startButton.isHidden = true
        passButton.isHidden = false
        
        
        secondsLeftLabel.text = String(elapsedTime)
    }
    
    func randomWordGenerator() -> Word {
        return wordManager.words.randomElement() ?? Word(word: "Funka ej", answer: "Funkar inte")
    }
    
    func gameStart() {
        
        if totalTime > 0 {
            
            let randomWord = randomWordGenerator()
            wordLabel.text = randomWord.word
        }
        
    }
}
