//
//  GameplayViewController.swift
//  TurboType
//
//  Created by Robin jakobsson on 2025-03-25.
//
//hej
import UIKit
import AVFoundation


class GameplayViewController: UIViewController, UITextFieldDelegate{
    var wordManager = WordManager()
    var soundEffectPlayer: AVAudioPlayer?
    var backgroudMusicPlayer: AVAudioPlayer?


    
    @IBOutlet weak var hiddenWord: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var passButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var secondsLeftLabel: UILabel!
    @IBOutlet weak var timerView: UIProgressView!
    
    var language : String?
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
        playBackgroundMusic()
        
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
        updateUI()
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
                self.startBlinking()
            } else {
                self.timerView.progressTintColor = UIColor.black
            }
            
            
            if self.elapsedTime <= 0 {
                
                self.elapsedTime = 0
                timer.invalidate()
                
                self.saveToUserDefaults()
                
                self.stopBackgroundMusic()
                
                self.performSegue(withIdentifier: "toEndGame", sender: nil)
                
               // self.alertBox()
            }
        }
        
    }
    
    func startBlinking() {
        UIView.animate(withDuration: 0.3, delay: 0, options: [.autoreverse, .repeat], animations: {
            self.timerView.alpha = 0

        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toEndGame" {
            
            let destinationVC = segue.destination as? EndgameViewController
            
            destinationVC?.totalTime = totalTime
            destinationVC?.score = points
        }
        
    }
    
    func updateUI() {
        textField.isHidden = false
        wordLabel.isHidden = false
        pointsLabel.isHidden = false
        secondsLeftLabel.isHidden = false
        timerView.isHidden = false
        passButton.isHidden = false
        
        let minutes = Int(elapsedTime) / 60
        let seconds = Int(elapsedTime) % 60
        
        secondsLeftLabel.text = String(format: "%02d:%02d", minutes, seconds)
        pointsLabel.text = String(points)
        wordLabel.text = currentWord.word
    }
    
    func randomWordGenerator() -> Word {
        if language == "English" {
            return wordManager.englishWords.randomElement() ?? Word(word: "Funka ej", answer: "Funkar inte")
            
        } else if language == "Spanish" {
            return wordManager.spanishWords.randomElement() ?? Word(word: "funka ej spanska", answer: "funkar ej")
        }
        else {
            return wordManager.germanWords.randomElement() ?? Word(word: "Funka ej tyska", answer: "hello world")
        }
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
            playSoundEffect(forResource: "correct")

            
        } else {
            hiddenWord.text = word.answer
            hiddenWord.isHidden = false
            print("Fel svar")
            elapsedTime -= 5
            self.view.backgroundColor = UIColor.fromHex("#ED696B")
            playSoundEffect(forResource: "incorrect")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.view.backgroundColor = UIColor.fromHex("#A1B5D8")
            self.currentWord = self.randomWordGenerator()
            self.hiddenWord.isHidden = true
            self.updateUI()
        }
        
    }
    
    
    func resetGame() {
        hiddenWord.isHidden = true
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
        
        if scores.count > 10 {
            scores.removeLast()
        }
        
        userDefaults.set(scores, forKey: "highScores")
    }
    
    func playSoundEffect(forResource resource: String) {
        if let url = Bundle.main.url(forResource: resource, withExtension: "mp3") {
            do {
                soundEffectPlayer = try AVAudioPlayer(contentsOf: url)
                soundEffectPlayer?.play()
            } catch {
                print("Kunde inte spela upp ljudet")
            }
        }
    }
    
    func playBackgroundMusic() {
        if let url = Bundle.main.url(forResource: "gameMusic", withExtension: "mp3") {
            do {
                backgroudMusicPlayer = try AVAudioPlayer(contentsOf: url)
                backgroudMusicPlayer?.volume = 0.7
                backgroudMusicPlayer?.numberOfLoops = -1
                backgroudMusicPlayer?.play()
            } catch {
                print("Kunde inte spela musik")
            }
        }
    }
    
    func stopBackgroundMusic() {
        backgroudMusicPlayer?.stop()
    }
}
