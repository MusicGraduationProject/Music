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
        NavigationView {
            WelcomePage()
                .environmentObject(MusicModel())
        }
        
    }
}
