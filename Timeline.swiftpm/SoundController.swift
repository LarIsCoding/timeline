//
//  Sound.swift
//  WWDC-2022
//
//  Created by Larissa Gomes de Stefano Escaliante on 24/04/22.
//

import AVFoundation

class SoundController {
    
    var audioPlayer: AVAudioPlayer?
    
    func playMusic() {
        playSound("fall")
    }
    
    func playButtonSound() {
        playSound("button")
    }
    
    func playRightSound() {
        playSound("right")
    }
    
    func playWrongSound() {
        playSound("wrong")
    }
    
    private func playSound(_ file: String) {
        if let path = Bundle.main.path(forResource: file, ofType: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("ERROR: Could not find and play the sound file!")
            }
        }
    }
}
