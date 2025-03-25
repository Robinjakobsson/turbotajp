//
//  GameSettingsViewController.swift
//  TurboType
//
//  Created by Robin jakobsson on 2025-03-25.
//

import UIKit

class GameSettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {
   
    
    @IBOutlet weak var difficultyLevelPicker: UIPickerView!
    
    var difficulty = ["Easy", "Medium", "Hard"]
    
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
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return difficulty.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return difficulty[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
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
            
            destinationVC?.difficulty = timer
        }
        
    }

}
