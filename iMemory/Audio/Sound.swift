/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Thai Manh Phi
  ID: s3878070
  Created  date: 25/08/2022
  Last modified: 27/08/2022
  Acknowledgement:
 1. https://www.hackingwithswift.com/forums/swiftui/playing-sound/4921
 2. https://stackoverflow.com/questions/59404039/how-to-play-audio-using-avaudioplayer-in-swiftui-project
*/

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
