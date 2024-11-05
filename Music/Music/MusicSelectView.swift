import SwiftUI
import AVFoundation

struct MusicSelectView: View {
    @EnvironmentObject var musicModel: MusicModel  // environmentObject로 전달된 MusicModel 사용
    @State private var showFilePicker = false
    @State private var sampleMusicName: String = "음악 이름"
    @State private var mrMusicName: String = "음악 이름"
    @State private var isSampleSelected = true
    
    @StateObject private var audioPlayerViewModel = AudioPlayerViewModel()  // 오디오 플레이어 상태 관리
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                
                // Sample 섹션
                VStack {
                    HStack {
                        Label("Sample", systemImage: "music.note")
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button(action: {
                            isSampleSelected = true
                            showFilePicker.toggle()
                        }) {
                            Text("Select File")
                                .foregroundColor(.white)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color.red)
                    }
                    
                    HStack {
                        Spacer()
                        Text(sampleMusicName)
                            .foregroundColor(.white)
                    }
                    
                    // 음악 파일이 선택되면 재생 버튼 표시
                    if sampleMusicName != "음악 이름" {
                        Button(action: {
                            audioPlayerViewModel.playOrPause()
                        }) {
                            Image(systemName: audioPlayerViewModel.isPlaying ? "pause.circle" : "play.circle")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding()
                .border(Color.white)

                // MR 섹션
                VStack {
                    HStack {
                        Label("MR", systemImage: "music.mic")
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button(action: {
                            isSampleSelected = false
                            showFilePicker.toggle()
                        }) {
                            Text("Select File")
                                .foregroundColor(.white)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color.red)
                    }
                    
                    HStack {
                        Spacer()
                        Text(mrMusicName)
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .border(Color.white)

                Spacer()

                // MusicPlayView로 이동하는 링크
                NavigationLink(destination: MusicPlayView()) {
                    ZStack {
                        Capsule()
                            .frame(width: 300, height: 50)
                            .foregroundColor(.blue)

                        Text("Music Play")
                            .foregroundColor(.white)
                    }
                }
            }
            .padding()
        }
        // 파일 선택기 호출 및 결과 처리
        .sheet(isPresented: $showFilePicker) {
            DocumentPicker(allowedTypes: ["public.audio"]) { result in
                switch result {
                case .success(let urls):  // 성공적으로 URL을 가져왔을 때
                    guard let url = urls.first else { return }

                    let fileName = url.lastPathComponent
                    
                    if isSampleSelected {
                        sampleMusicName = fileName  // Sample 파일의 이름 업데이트
                        audioPlayerViewModel.initializePlayer(with: url)  // 오디오 플레이어 초기화
                    } else {
                        mrMusicName = fileName  // MR 파일의 이름 업데이트
                    }

                case .failure(let error):  // 파일 선택 실패 시 에러 처리
                    print("Error selecting file: \(error.localizedDescription)")
                }
            }
        }
    }
}

struct MusicSelectView_Previews: PreviewProvider {
    static var previews: some View {
        MusicSelectView().environmentObject(MusicModel())
    }
}
