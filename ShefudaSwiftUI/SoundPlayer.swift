//
//  SoundPlayer.swift
//  Shefuda
//
//  Created by Shawon Ashraf on 8/3/18.
//  Copyright © 2018 Shawon Ashraf. All rights reserved.
//
import Foundation
import AVFoundation
import UIKit

// error type
enum SoundPlayerError: Error {
    case ClipNotFound(String)
    case CantPlay(String)
}

final class SoundPlayer {
    
    // MARK: This class is a singleton
    static let instance: SoundPlayer = SoundPlayer()
    
    // MARK: audioPlayer init
    private var audioPlayer = AVAudioPlayer()
    
    // MARK: Helper methods
    // plays soundclip by title
    func play(soundFile fileName: String) throws {
        if let soundFileURL = try? getSoundFileURL(fileName: fileName) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundFileURL)
                audioPlayer.prepareToPlay()
                
            
                // init audio player session
                let session = AVAudioSession.sharedInstance()
                do {
                    try session.setCategory(.playback, mode: .spokenAudio, options: .defaultToSpeaker)
                } catch let error {
                    print(error)
                }
            } catch {
                throw SoundPlayerError.CantPlay("Can't play this file, file went missing!")
            }
            
            // play
            audioPlayer.play()
        } else {
            print("File wasn't found!")
        }
    }
    
    // gets soundfile url by title
    func getSoundFileURL(fileName: String) throws -> URL? {
        let soundResource = fileName

        let file = Bundle.main.path(forResource: soundResource, ofType: "mp3")

        if let fileURL = file {
            let url = URL(fileURLWithPath: fileURL)
            return url
        } else {
            throw SoundPlayerError.ClipNotFound("File Not Found!")
        }
    }
}
