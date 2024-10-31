

////
////  WelcomPage.swift
////  Music
////
////  Created by 박성수 on 10/24/24.
////
//
//import SwiftUI
//
//struct WelcomPage: View {
//
//    var body: some View {
//            VStack {
//                // Title text at the top
//                Text("Sample transformed")
//                    .font(.largeTitle)
//                    .bold()
//                    .padding(.top, 40)
//                    .foregroundColor(.white)
//
//                Spacer()
//
//                // Central custom image with a circular background
//                Image("Image") // Replace this with your image's name in Assets
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 150, height: 150)
//                    .background(
//                        Circle()
//                            .fill(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.black]), startPoint: .top, endPoint: .bottom))
//                            .frame(width: 200, height: 200)
//                    )
//
//                Spacer()
//
//                // Button at the bottom
//                Button(action: {
//                    viewTransformedResult()
//                }) {
//                    Text("View transformed result")
//                        .font(.headline)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color.white)
//                        .foregroundColor(.black)
//                        .cornerRadius(10)
//                        .padding(.horizontal, 20)
//                        .padding(.bottom, 40)
//                }
//            }
//            .background(Color.gray) // Background color for the entire view
//            .edgesIgnoringSafeArea(.all)
//        }
//
//        // Placeholder function for button action
//        func viewTransformedResult() {
//            // Action to show the transformed result
//        }
//    }
//
//#Preview {
//    NavigationView {
//        WelcomPage()
//    }
//}



import SwiftUI

struct WelcomPage: View {
    var body: some View {
        NavigationView { // 네비게이션을 위한 NavigationView 추가
            VStack {
                // 상단의 제목 텍스트
                Text("Sample transformed")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 40)
                    .foregroundColor(.white)
                
                Spacer()
                
                // 원형 배경과 이미지
                ZStack {
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.black]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 200, height: 200)
                    
                    Image("Image") // Assets에 추가된 이미지 이름을 사용
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                }
                
                Spacer()
                
                // 하단의 버튼
                NavigationLink(destination: MusicSelectView()) { // ResultView로 이동하는 링크 추가
                    Text("음악 만들기")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 40)
                }
            }
            .background(Color.gray)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ResultView: View {
    var body: some View {
        VStack {
            Text("Transformed Result")
                .font(.largeTitle)
                .bold()
                .padding(.top, 40)
                .foregroundColor(.black)
            
            Spacer()
            
            // 결과 화면의 내용 (예: 텍스트, 이미지, 기타 UI 요소)
            Text("This is the transformed result.")
                .font(.title)
                .padding()
            
            Spacer()
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    WelcomPage()
}
