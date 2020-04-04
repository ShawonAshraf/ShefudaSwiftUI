//
//  DataLoader.swift
//  ShefudaSwiftUI
//
//  Created by Shawon Ashraf on 05.04.20.
//  Copyright © 2020 Shawon Ashraf. All rights reserved.
//

import Foundation

let fileName = "clip_data"

func loadJSON() -> [SoundClip] {
    var soundClips: [SoundClip] = []
    
    if let filePath = Bundle.main.path(forResource: fileName, ofType: "json") {
        let reader = FileHandle(forReadingAtPath: filePath)
        guard let json = reader?.readDataToEndOfFile() else { return soundClips }
        
        guard let parsed = try? JSONDecoder().decode([SoundClip].self, from: json) else { return soundClips }
        soundClips = parsed
    }
    
    return soundClips
}
