//
//  GameplayViewController.swift
//  TurboType
//
//  Created by Robin jakobsson on 2025-03-25.
//
//hej
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
    var totalTime : Double?
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        resetGame()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if elapsedTime < totalTime ?? 1 {
            
            guard let inputText = textField.text else {
                return true
            }
            
            checkInput(input: inputText, word: currentWord)
            
            textField.text = ""
            
            return true
            
        }
        return true
    }

    
    @IBAction func passButtonPressed(_ sender: Any) {
        let newRandomWord = randomWordGenerator()
        currentWord = newRandomWord
        elapsedTime -= 2.5
        points -= 5
        
        updateUI()
    }
    
    
    @IBAction func startButton(_ sender: Any) {
        updateUI()
        textField.becomeFirstResponder()
        startTimer()
    }
    
    
    func startTimer() {
        let interval = 0.1
        
        self.elapsedTime = totalTime!
        
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
            self.elapsedTime -= interval
            
            let progress = 1.0 - Float(self.elapsedTime / self.totalTime!)
            self.timerView.setProgress(progress, animated: true)
            self.updateUI()
            
            if self.elapsedTime <= 5 {
                self.timerView.progressTintColor = UIColor.red
            } else {
                self.timerView.progressTintColor = UIColor.black
            }
            
            
            if self.elapsedTime <= 0 {
                
                self.elapsedTime = 0
                timer.invalidate()
                
                self.performSegue(withIdentifier: "toEndGame", sender: nil)
                
               // self.alertBox()
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toEndGame" {
            
            let destinationVC = segue.destination as? EndgameViewController
            
            destinationVC?.totalTime = totalTime
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
        wordLabel.text = currentWord.word
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

            self.view.backgroundColor = UIColor.fromHex("#82DE60")

            
        } else {
            print("Fel svar")
            elapsedTime -= 5
            self.view.backgroundColor = UIColor.fromHex("#ED696B")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.view.backgroundColor = UIColor.fromHex("#A1B5D8")
            self.currentWord = self.randomWordGenerator()
            self.updateUI()
        }

    }
    
    func alertBox() {
        let alertController = UIAlertController(title: "Times Up!", message: "You managed to score a whooping total of \(points) points!", preferredStyle: .alert)
            saveToUserDefaults()
        
        let tryAgainAction = UIAlertAction(title: "Try again?", style: .default) { _ in
            self.resetGame()
        }
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.performSegue(withIdentifier: "toEndGame", sender: self)
            
        }
        alertController.addAction(okAction)
        alertController.addAction(tryAgainAction)
        
        present(alertController,animated: true, completion: nil)
    }
    
    func resetGame() {
        points = 0
        elapsedTime = 0.0
        elapsedTime = totalTime!
        
        pointsLabel.text = "0"
        timerView.setProgress(0.0, animated: true)
        
        currentWord = randomWordGenerator()
        wordLabel.text = currentWord.word
        
        timer?.invalidate()
        startTimer()
    }
    
    func saveToUserDefaults() {
        let userDefaults = UserDefaults.standard
        var scores = userDefaults.array(forKey: "highScores") as? [Int] ?? []
        
        scores.append(points)
        scores.sort(by: >)
        
        userDefaults.set(scores, forKey: "highScores")
    }
}
