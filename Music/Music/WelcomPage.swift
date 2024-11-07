import SwiftUI

struct WelcomePage: View {
    @EnvironmentObject var musicModel: MusicModel

    var body: some View {
        ZStack {
            // 배경을 그라데이션으로 설정
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Spacer()
                
                // 제목 섹션
                Text("Welcome to Music App")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
                    .padding(.top, 50)
                
                // 원형 이미지 섹션
                ZStack {
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 220, height: 220)
                        .shadow(color: .orange.opacity(0.6), radius: 10, x: 0, y: 10)
                    
                    Image("Image") // 이미지 이름을 적절히 설정하세요.
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 4)
                        )
                        .shadow(color: .black.opacity(0.2), radius: 7, x: 0, y: 5)
                }
                
                Spacer()

                // 애니메이션 효과가 있는 버튼
                NavigationLink(destination: MusicSelectView().environmentObject(musicModel)) {
                    Text("Go to Music Select")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal, 30)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing)
                        )
                        .cornerRadius(20)
                        .shadow(color: Color.blue.opacity(0.4), radius: 10, x: 0, y: 5)
                }
                .padding(.bottom, 50)
                .scaleEffect(1.05)
                .animation(Animation.easeInOut(duration: 1.2).repeatForever(autoreverses: true))
            }
            .padding()
        }
    }
}

struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WelcomePage().environmentObject(MusicModel())
        }
        
    }
}
