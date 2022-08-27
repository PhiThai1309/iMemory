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
 1. https://stackoverflow.com/questions/34600644/creating-music-instance-in-every-view-controller
*/

import Foundation
import AVFoundation

//Use class here to create a singleton for the music not passing to another view
class MusicPlayer {
    static let shared = MusicPlayer()
    var audioPlayer: AVAudioPlayer?

    //Function to play music in a loop ceating a background music
    func startBackgroundMusic(backgroundMusicFileName: String) {
        if let bundle = Bundle.main.path(forResource: backgroundMusicFileName, ofType: "mp3") {
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                guard let audioPlayer = audioPlayer else { return }
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {
                print(error)
            }
        }
    }
    
    //function to stop playing music
    func stopBackgroundMusic() {
        guard let audioPlayer = audioPlayer else { return }
        audioPlayer.stop()
    }
}
