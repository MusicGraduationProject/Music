//
//  MusicApp.swift
//  Music
//
//  Created by 박성수 on 10/24/24.
//


// 문제 없이 커밋 테스트 
import SwiftUI

@main
struct MusicApp: App {
    @StateObject var musicModel: MusicModel = MusicModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                WelcomPage()
                    .environmentObject(musicModel)
            }
            
        }
    }
}
