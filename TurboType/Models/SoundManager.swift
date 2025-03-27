//
//  SoundManager.swift
//  TurboType
//
//  Created by Emilia Forsheim on 2025-03-27.
//

import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    
    var endGameSound: AVAudioPlayer?
    var gameMusicPlayer: AVAudioPlayer?
    var soundEffectPlayer: AVAudioPlayer?
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
                    print("Kunde inte spela upp ljud")
                }
            }
        }
    }
    
    func playSoundEffect(forResource resource: String) {
        if let url = Bundle.main.url(forResource: resource, withExtension: "mp3") {
            do {
                soundEffectPlayer = try AVAudioPlayer(contentsOf: url)
                if !isMuted {
                    soundEffectPlayer?.play()
                }
            } catch {
                print("Kunde inte spela upp ljudet")
            }
        }
    }
    
    func playGameMusic() {
        if let url = Bundle.main.url(forResource: "gameMusic", withExtension: "mp3") {
            do {
                gameMusicPlayer = try AVAudioPlayer(contentsOf: url)
                gameMusicPlayer?.volume = 0.7
                gameMusicPlayer?.numberOfLoops = -1
                if !isMuted {
                    gameMusicPlayer?.play()
                }
            } catch {
                print("Kunde inte spela musik")
            }
        }
    }
    
    func endGameMusic(forResource resource: String) {
        if let url = Bundle.main.url(forResource: resource, withExtension: "mp3") {
            do {
                endGameSound = try AVAudioPlayer(contentsOf: url)
                if !isMuted {
                    endGameSound?.play()
                }
            } catch {
                print("Kunde inte spela upp ljudet")
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
        
        gameMusicPlayer?.stop()
        gameMusicPlayer = nil

        player?.stop()
        player = nil
    }

}
