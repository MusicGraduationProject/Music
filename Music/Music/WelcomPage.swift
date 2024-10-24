//
//  WelcomPage.swift
//  Music
//
//  Created by 박성수 on 10/24/24.
//

import SwiftUI

struct WelcomPage: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("홈 화면")
            
            Spacer()
            
            NavigationLink(destination: MusicSelectView()) {
                ZStack {
                    Rectangle()
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                        .frame(height: 100)
                    Text("음악 만드는 화면")
                        .foregroundStyle(.white)
                }
                
            }
            
            NavigationLink(destination: EmptyView()) {
                ZStack {
                    Rectangle()
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                        .frame(height: 100)
                    Text("저장된 음악 화면")
                        .foregroundStyle(.white)
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    NavigationView {
        WelcomPage()
    }
}
