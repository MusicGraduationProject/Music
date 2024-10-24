//
//  MusicSelectView.swift
//  Music
//
//  Created by 박성수 on 10/24/24.
//

import SwiftUI

struct MusicSelectView: View {
    
    var body: some View {
        VStack {
            NavigationLink(destination: MusicPlayView()) {
                Text("musicplay")
            }
        }
    }
}

#Preview {
    NavigationView {
        MusicSelectView()
    }
}
