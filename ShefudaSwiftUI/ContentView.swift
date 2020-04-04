//
//  ContentView.swift
//  ShefudaSwiftUI
//
//  Created by Shawon Ashraf on 05.04.20.
//  Copyright © 2020 Shawon Ashraf. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let soundClips = loadJSON()
    
    var body: some View {
        VStack {
            // MARK: title
            Text("শেফুদার সাউন্ডবোর্ড")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // MARK: table row
            List {
                ForEach(0 ..< soundClips.count) { i in
                    TableRow(title: self.soundClips[i].title, fileName: self.soundClips[i].fileName)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
