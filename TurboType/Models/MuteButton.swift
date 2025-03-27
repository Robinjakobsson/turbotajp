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
        self.setTitle(SoundManager.shared.isMuted ? "Unmute" : "Mute", for: .normal)
        self.addTarget(self, action: #selector(toggleSound), for: .touchUpInside)
    }
    
    @objc private func toggleSound() {
        SoundManager.shared.toggleMute()
        self.setTitle(SoundManager.shared.isMuted ? "Unmute" : "Mute", for: .normal)
    }
    
}
