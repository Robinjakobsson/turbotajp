//
//  GameSettingsViewController.swift
//  TurboType
//
//  Created by Robin jakobsson on 2025-03-25.
//
//hej

import UIKit

class GameSettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {
   
    
    @IBOutlet weak var difficultyLevelPicker: UIPickerView!
    
    var difficulty = ["Easy", "Medium", "Hard"]
    var language = ["German","Spanish","English","French","Valyrian","Dothraki"]
    var chosenLanguage : String!
    var timer : Double = 0.0
    
    let gameSegue = "GameVCSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        difficultyLevelPicker.delegate = self
        difficultyLevelPicker.dataSource = self
        
    }
    
    @IBAction func startGameButton(_ sender: UIButton) {
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return difficulty.count
        } else {
            return language.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return difficulty[row]
        } else {
            return language[row]
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        chosenLanguage = language[row]
        print("\(String(describing: chosenLanguage)) selected")
        //let choosenDifficulty = difficulty[row]
        //Just a comment.
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == gameSegue {
            
            let destinationVC = segue.destination as? GameplayViewController
            
           let choosenDifficultyLevel = difficulty[difficultyLevelPicker.selectedRow(inComponent: 0)]
            
            
            if choosenDifficultyLevel == "Easy" {
                timer = 60.0
            } else if choosenDifficultyLevel == "Medium" {
                timer = 45.0
            } else {
                timer = 30.0
            }
            
            destinationVC?.totalTime = timer
            destinationVC?.language = chosenLanguage
            destinationVC?.difficulty = choosenDifficultyLevel
            
            SoundManager.shared.stopMusic()
        }
        
    }

}
