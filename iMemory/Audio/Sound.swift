//
//  Sound.swift
//  iMemory
//
//  Created by Phi Thai on 25/08/2022.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

//Function to play a music for one time
func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Error")
        }
    }
}
