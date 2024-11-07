import SwiftUI
import AVFoundation

struct MusicPlayView: View {
    @EnvironmentObject var musicModel: MusicModel
    @EnvironmentObject var audioPlayerViewModel: AudioPlayerViewModel
    
    var body: some View {
        ZStack {
            // 배경색을 연보라색으로 변경
            
            if musicModel.isLoading {
                Color.gray.ignoresSafeArea().opacity(0.9)
                
                ZStack {
                    Rectangle()
                        .frame(width: 150, height: 150)
                        .cornerRadius(10)
                        .foregroundColor(.cyan)
                    
                    VStack {
                        ProgressView()
                            .padding()
                        Text("음악이 로딩중입니다.")
                    }
                }
            }
            
            VStack(spacing: 20) {
                // 상단에 "Result" 텍스트 추가 (왼쪽 정렬, 흰색)
            
                HStack {
                    Text("Result")
                        .padding()
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.bottom, 20)

                HStack(spacing: 40) {
                    Button(action: {
                        audioPlayerViewModel.playGeneratedMusic(music: musicModel.generatedMusic!)
                    }) {
                        Image(systemName: "play.circle")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                    }

                    Button(action: {}) {
                        Image(systemName: "square.and.arrow.down")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                    }
                }

                Spacer()

                Button(action: {}) {
                    VStack {
                        Image(systemName: "music.note.list")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)

                        Text("Result")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                }
            }.padding().background(Color(red: 0.8, green: 0.7, blue: 1.0))
                
        }
        .navigationTitle("Music Play")
    }
}

struct MusicPlayView_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayView()
            .environmentObject(MusicModel())
            .environmentObject(AudioPlayerViewModel())
    }
}
