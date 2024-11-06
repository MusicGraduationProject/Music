//
//
//import SwiftUI
//
//struct WelcomPage: View {
//    @EnvironmentObject var musicModel: MusicModel
//
//    var body: some View {
//        NavigationView { // 네비게이션을 위한 NavigationView 추가
//            VStack {
//                // 상단의 제목 텍스트
//                Text("Sample transformed")
//                    .font(.largeTitle)
//                    .bold()
//                    .padding(.top, 40)
//                    .foregroundColor(.white)
//
//                Spacer()
//
//                // 원형 배경과 이미지
//                ZStack {
//                    Circle()
//                        .fill(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.black]), startPoint: .top, endPoint: .bottom))
//                        .frame(width: 200, height: 200)
//
//                    Image("Image") // Assets에 추가된 이미지 이름을 사용
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 150, height: 150)
//                        .clipShape(Circle())
//                }
//
//                Spacer()
//
//                // 하단의 버튼
//                NavigationLink(destination: MusicSelectView()
//                    .environmentObject(musicModel)) { // ResultView로 이동하는 링크 추가
//                        Text("음악 만들기")
//                            .font(.headline)
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Color.white)
//                            .foregroundColor(.black)
//                            .cornerRadius(10)
//                            .padding(.horizontal, 20)
//                            .padding(.bottom, 40)
//                    }
//            }
//            .background(Color.gray)
//            .edgesIgnoringSafeArea(.all)
//        }
//    }
//}
//
//struct ResultView: View {
//    var body: some View {
//        VStack {
//            Text("Transformed Result")
//                .font(.largeTitle)
//                .bold()
//                .padding(.top, 40)
//                .foregroundColor(.black)
//
//            Spacer()
//
//            // 결과 화면의 내용 (예: 텍스트, 이미지, 기타 UI 요소)
//            Text("This is the transformed result.")
//                .font(.title)
//                .padding()
//
//            Spacer()
//        }
//        .background(Color.white)
//        .edgesIgnoringSafeArea(.all)
//    }
//}
//
//#Preview {
//    WelcomPage()
//        .environmentObject(MusicModel())
//}

import SwiftUI

struct WelcomePage: View {
    @EnvironmentObject var musicModel: MusicModel
    var body: some View {
        VStack {
            // 기존 레이아웃 코드 유지
            Text("Welcome to Music App") // 예시: 기존 레이아웃 요소
                .font(.largeTitle)
                .padding()
            
            
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
            // MusicSelectView로 이동하는 버튼
            NavigationLink(destination: MusicSelectView()
                .environmentObject(musicModel)) {
                Text("Go to Music Select") // "Music Select" 버튼 텍스트
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
        
    }
    
}
struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePage()
            .environmentObject(MusicModel())
    }
}
