//
//  SoundManager.swift
//  TurboType
//
//  Created by Emilia Forsheim on 2025-03-27.
//

import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    
    var player: AVAudioPlayer?
    
    private init() {}
    
    func playerBackgroundMusic(forResource resource: String) {
        if player == nil {
            if let url = Bundle.main.url(forResource: resource, withExtension: "mp3") {
                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    player?.numberOfLoops = -1
                    player?.play()
                } catch {
                    print("Error playing background music:")
                }
            }
        }
    }
    
    func stopMusic() {
        player?.stop()
        player = nil
    }
}
