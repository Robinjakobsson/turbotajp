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
    //@IBOutlet weak var textField: UITextField!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var secondsLeftLabel: UILabel!
    @IBOutlet weak var timerView: UIProgressView!
    
    var difficulty : String?
    var language : String?
    var points : Int = 0
    var totalTime : Double?
    var elapsedTime : Double = 0.0
    var timer : Timer?
    var currentWord : Word!
    
    @IBOutlet weak var inputStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentWord = randomWordGenerator()
        
        wordLabel.text = currentWord.word
        
        createTextFields(currentWord.answer)
        playBackgroundMusic()
        
        inputStackView.axis = .horizontal
        inputStackView.spacing = 10
        inputStackView.alignment = .center
        inputStackView.distribution = .fillEqually
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        inputStackView.axis = .horizontal
        inputStackView.spacing = 10
        inputStackView.alignment = .center
        inputStackView.distribution = .fillEqually
        resetGame()
    }
    
    
    func createTextFields(_ word : String) {
        
        print("Creating text fields for answer: \(word)")
        
        for subview in inputStackView.arrangedSubviews {
            subview.removeFromSuperview()
        }
        
        let answer = currentWord.answer
        
        for _ in answer {
            let textField = UITextField()
            textField.delegate = self
            textField.borderStyle = .roundedRect
            textField.textAlignment = .center
            textField.keyboardType = .default
            textField.returnKeyType = .done
            textField.isUserInteractionEnabled = true
            textField.autocapitalizationType = .allCharacters
            
            
            inputStackView.addArrangedSubview(textField)
            
        }
        
        for subview in inputStackView.arrangedSubviews {
            if let textfield = subview as? UITextField {
                textfield.text = ""
            }
        }
        
        if let firstTextField = inputStackView.arrangedSubviews.first as? UITextField {
            firstTextField.becomeFirstResponder()
        }
        
    }
    
    func textField(_ textField : UITextField, shouldChangeCharactersIn range: NSRange, replacementString string : String) -> Bool {
        
       
        
        if string.count > 1 {
            return false
        }
        
        if let currentIndex = inputStackView.arrangedSubviews.firstIndex(of: textField), string.count == 1 {
            textField.text = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
            
            if currentIndex + 1 < inputStackView.arrangedSubviews.count {
                let nextTextField = inputStackView.arrangedSubviews[currentIndex + 1] as! UITextField
                nextTextField.becomeFirstResponder()
            }
            return false
        }
        return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if elapsedTime < totalTime ?? 1 {
            
            let allFilled = inputStackView.arrangedSubviews.allSatisfy {
                if let textField = $0 as? UITextField {
                    return !(textField.text?.isEmpty ?? true)
                    
                }
                return false
            }
            
            if allFilled {
                checkInput()
            }
            
            textField.resignFirstResponder()
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
        //textField.isHidden = false
        
        inputStackView.axis = .horizontal
        inputStackView.spacing = 10
        inputStackView.alignment = .center
        inputStackView.distribution = .fillEqually
        
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
        } else if language == "French" {
            return wordManager.frenchWords.randomElement() ?? Word(word: "Funka ej fRANKSA", answer: "ss")
        } else if language == "Rövarspråket" {
            return wordManager.rovarspraket.randomElement() ?? Word(word: "Funka ej rovarspraket", answer: "ss")
        } else if language == "Dothraki" {
            return wordManager.dothrakiWords.randomElement() ?? Word(word: "Funka ej dothraki", answer: "ss")
        } else if language == "Valyrian" {
            return wordManager.valyrianWords.randomElement() ?? Word(word: "Funka ej valyrian", answer: "ss")
        }
        else if language == "German" {
            return wordManager.germanWords.randomElement() ?? Word(word: "Funka ej tyska", answer: "hello world")
        }
        return wordManager.englishWords.randomElement() ?? Word(word: "asd", answer: "asd")
    }
    
    func checkInput() {
        
        print("Current answer: \(currentWord.answer) and Current Word: \(currentWord.word)")
        
        var inputText = ""
        
        for subview in inputStackView.arrangedSubviews {
            if let textField = subview as? UITextField {
                if let text = textField.text {
                    inputText += text
                }
            }
        }
        
        
        
        let trimmedInput = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedAnswer = currentWord.answer.trimmingCharacters(in: .whitespacesAndNewlines)
        
        print("\(trimmedInput)")
        print("trimmed answer:\(trimmedAnswer)")
        
        
        
        if trimmedInput.lowercased() == trimmedAnswer.lowercased() {
            points += 10
            print("Rätt svar!")

            self.view.backgroundColor = UIColor.fromHex("#82DE60")
            playSoundEffect(forResource: "correct")

            
        } else {
            hiddenWord.text = currentWord.answer
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
            self.createTextFields(self.currentWord.answer)
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
        
        var scores = userDefaults.array(forKey: "highScores") as? [[String: Any]] ?? []
        
        let newScore: [String: Any] = [
            "points": points,
            "language": language ?? "Unknown",
            "difficulty": difficulty ?? "Unknown"
        ]
     
        scores.append(newScore)
        scores.sort { ($0["points"] as? Int ?? 0) > ($1["points"] as? Int ?? 0) }
        
        if scores.count > 10 {
            scores.removeLast()
        }
        userDefaults.set(scores, forKey: "highScores")
        print("Saved high scores: \(scores)")
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
