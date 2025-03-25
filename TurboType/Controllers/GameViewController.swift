//
//  GameplayViewController.swift
//  TurboType
//
//  Created by Robin jakobsson on 2025-03-25.
//

import UIKit

class GameplayViewController: UIViewController {
    
    var difficulty : Double?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let difficulty = difficulty {
            
            print("String received \(difficulty)")
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
