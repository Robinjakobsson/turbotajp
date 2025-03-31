//
//  HomeViewController.swift
//  TurboType
//
//  Created by Robin jakobsson on 2025-03-25.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SoundManager.shared.playBackgroundMusic(forResource: "backgroundMusic")
    }
    
    @IBAction func infoButtonTapped(_ sender: UIButton) {
        alertBox()
    }
    
    func alertBox() {
        let titleText = "Game Info\n"
        let messageText = """
        Your goal is to translate the words as fast as possible before before time runs out.\n
        Difficulty levels:\n
        Easy: 60 seconds per round\n
        Medium: 45 seconds per round\n
        Hard: 30 seconds per round
        """
        
        let alertController = UIAlertController(title: titleText, message: messageText, preferredStyle: .alert)
        
        alertController.view.subviews.first?.subviews.first?.subviews.first?.applyStyle(
            backgroundColor: .fromHex("#E2E8ED"),
            borderColor: .black,
            borderWidth: 2,
            cornerRadius: 10
        )
        
        alertController.setAttributedText(title: titleText, message: messageText, color: .black)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        okAction.setValue(UIColor.black, forKey: "titleTextColor")
        alertController.addAction(okAction)
        
        present(alertController, animated: true , completion: nil)
        
    }
    
}
    
extension UIView {
    func applyStyle(backgroundColor: UIColor, borderColor: UIColor, borderWidth: CGFloat, cornerRadius: CGFloat) {
        self.backgroundColor = backgroundColor
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
    }
}

extension UIAlertController {
    func setAttributedText(title: String, message: String, color: UIColor) {
        let attributes = [NSAttributedString.Key.foregroundColor: color]
        self.setValue(NSAttributedString(string: title, attributes: attributes), forKey: "attributedTitle")
        self.setValue(NSAttributedString(string: message, attributes: attributes), forKey: "attributedMessage")
    }
}

extension UIColor {
    static func fromHex(_ hex: String) -> UIColor {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if hexSanitized.hasPrefix("#") {
            hexSanitized.remove(at: hexSanitized.startIndex)
        }

        guard hexSanitized.count == 6 else { return UIColor.gray }

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        return UIColor(
            red: CGFloat((rgb >> 16) & 0xFF) / 255.0,
            green: CGFloat((rgb >> 8) & 0xFF) / 255.0,
            blue: CGFloat(rgb & 0xFF) / 255.0,
            alpha: 1.0
        )
    }
}

