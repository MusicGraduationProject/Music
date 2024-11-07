import SwiftUI
import AVFoundation

struct MusicPlayView: View {
    @EnvironmentObject var musicModel: MusicModel
    @EnvironmentObject var audioPlayerViewModel: AudioPlayerViewModel
    
    var body: some View {
        ZStack {
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

                HStack(spacing: 40) {

                    Button(action: {
                        audioPlayerViewModel.playGeneratedMusic(music:
                                                                    musicModel.generatedMusic!)
                    }) {
                        Image(systemName: "play.circle")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }

                    Button(action: {}) {
                        Image(systemName: "square.and.arrow.down")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }

                }

                Spacer()

                Button(action: {}) {
                    VStack {
                        Image(systemName: "music.note.list")
                            .resizable()
                            .frame(width: 40, height: 40)

                        Text("Result")
                            .font(.caption)
                    }
                }

            }.padding()
        }
        
         .navigationTitle("Music Play") // 상단 탐색 바 제목 설정
    }
}

struct MusicPlayView_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayView()
            .environmentObject(MusicModel())
            .environmentObject(AudioPlayerViewModel())
    }
}
