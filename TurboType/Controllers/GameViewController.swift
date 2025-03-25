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
    
    var points : Int = 0
    let totalTime : Double = 60.0
    var elapsedTime : Double = 0.0
    var timer : Timer?
    var currentWord : Word!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.returnKeyType = .done
        textField.delegate = self
        
        currentWord = randomWordGenerator()
        wordLabel.text = currentWord.word
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let inputText = textField.text else {
                   return true
               }
        
        checkInput(input: inputText, word: currentWord)
               currentWord = randomWordGenerator()
               wordLabel.text = currentWord.word
               
               textField.text = ""
               
               return true
           }

    
    @IBAction func passButtonPressed(_ sender: Any) {
    }
    
    
    @IBAction func startButton(_ sender: Any) {
        updateUI()
        textField.becomeFirstResponder()
        startTimer()
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
        pointsLabel.text = String(points)
    }
    
    func randomWordGenerator() -> Word {
        return wordManager.words.randomElement() ?? Word(word: "Funka ej", answer: "Funkar inte")
    }
    
    func checkInput(input : String, word: Word) {
        let trimmedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedAnswer = word.answer.trimmingCharacters(in: .whitespacesAndNewlines)
        
        print("\(trimmedInput)")
        print("trimmed answer:\(trimmedAnswer)")
        
        if trimmedInput.lowercased() == trimmedAnswer.lowercased() {
            points += 10
            print("Rätt svar!")
            
        } else {
            print("Fel svar")
            elapsedTime += 5
        }
        updateUI()
    }
}
