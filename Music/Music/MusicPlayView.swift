import SwiftUI
import AVFoundation

struct MusicPlayView: View {
    @EnvironmentObject var musicModel: MusicModel
    @EnvironmentObject var audioPlayerViewModel: AudioPlayerViewModel
    
    var body: some View {
        ZStack {
            // 배경색 설정
            LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.7), Color.blue.opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            if musicModel.isLoading {
                Color.black.opacity(0.8).ignoresSafeArea()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .frame(width: 180, height: 180)
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                    
                    VStack(spacing: 10) {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .cyan))
                            .scaleEffect(1.5)
                        Text("음악이 로딩 중입니다...")
                            .foregroundColor(.gray)
                            .font(.headline)
                    }
                }
            } else {
                VStack(spacing: 30) {
                    // 상단 텍스트
                    HStack {
                        Text("Generated Music")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    AsyncImage(url: musicModel.targetMusic?.imageUrl) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                        } else {
                            ProgressView()
                        }
                    }
                    .frame(width: 200, height: 200)
                    
                    
                    
                    // 음악 재생 및 다운로드 버튼
                    HStack(spacing: 50) {
                        Button(action: {
                            if let generatedMusic = musicModel.generatedMusic {
                                audioPlayerViewModel.playGeneratedMusic(music: generatedMusic)
                            }
                        }) {
                            Image(systemName: audioPlayerViewModel.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.white)
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                        }
                        
                        Button(action: {
                            // 다운로드 액션 추가 가능
                        }) {
                            Image(systemName: "square.and.arrow.down.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                        }
                    }
                    
                    Spacer()
                    
                    // 결과 버튼
                    Button(action: {
                        // 결과 액션 추가 가능
                    }) {
                        VStack {
                            Image(systemName: "music.note.list")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                            
                            Text("Result")
                                .foregroundColor(.white)
                                .font(.caption)
                        }
                        .padding()
                        .background(Circle().fill(Color.blue.opacity(0.8)))
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
        .navigationTitle("Music Play")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct MusicPlayView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            MusicPlayView()
//                .environmentObject(MusicModel())
//                .environmentObject(AudioPlayerViewModel())
//        }
//    }
//}
