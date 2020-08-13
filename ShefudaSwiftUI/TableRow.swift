//
//  TableRow.swift
//  ShefudaSwiftUI
//
//  Created by Shawon Ashraf on 05.04.20.
//  Copyright © 2020 Shawon Ashraf. All rights reserved.
//

import SwiftUI

struct TableRow: View {
    @State var showingSheet: Bool = false
    
    var title: String
    var fileName: String
    
    var body: some View {
        HStack {
            Text("\(self.title)")
                .onTapGesture {
                    try? SoundPlayer.instance.play(soundFile: self.fileName)
                }
            
            Spacer()
            
            #if os(iOS)
            Button(action: {
                // sharesheet action
                self.showingSheet.toggle()
            }) {
                Image(systemName: "square.and.arrow.up")
            }.sheet(isPresented: self.$showingSheet, onDismiss: nil) {
                ShareSheet(activityItems: [ try? SoundPlayer.instance.getSoundFileURL(fileName: self.fileName) as Any])
            }
            #endif
        }.padding()
    }
}

struct TableRow_Previews: PreviewProvider {
    static var previews: some View {
        TableRow(title: "ভালো মানুষ", fileName: "valo_manosh")
    }
}
