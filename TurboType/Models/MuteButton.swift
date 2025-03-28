//
//  MuteButton.swift
//  TurboType
//
//  Created by Emilia Forsheim on 2025-03-27.
//

import UIKit

class MuteButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    

    
    private func setupButton() {
        updateButtonImage()
        self.addTarget(self, action: #selector(toggleSound), for: .touchUpInside)
    }
    
    @objc private func toggleSound() {
        SoundManager.shared.toggleMute()
        updateButtonImage()
    }
    
    private func updateButtonImage() {
        let imageName = SoundManager.shared.isMuted ? "speaker.slash" : "speaker.wave.2"
        let image = UIImage(systemName: imageName)?
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: 30, weight: .regular))
        self.setImage(image, for: .normal)
    }
    
}
