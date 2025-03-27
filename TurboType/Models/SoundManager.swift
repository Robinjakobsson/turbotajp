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
    var isMuted: Bool = false
    
    private init() {}
    
    func playBackgroundMusic(forResource resource: String) {
        if player == nil {
            if let url = Bundle.main.url(forResource: resource, withExtension: "mp3") {
                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    player?.numberOfLoops = -1
                    if !isMuted {
                        player?.play()
                    }
                } catch {
                    print("Error playing background music:")
                }
            }
        }
    }
    
    func toggleMute() {
        isMuted.toggle()
        if isMuted {
            player?.pause()
        } else {
            player?.play()
        }
    }
    
    func stopMusic() {
        player?.stop()
        player = nil
    }
}
