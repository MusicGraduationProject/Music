
import SwiftUI
import AVFoundation

struct MusicSelectView: View {
    @EnvironmentObject var musicModel: MusicModel
    @State private var showFilePicker = false
    @State private var sampleMusicName: String = "음악 이름"
    @State private var mrMusicName: String = "음악 이름"
    @State private var isSampleSelected = true
    
    @StateObject private var sampleAudioPlayerViewModel = AudioPlayerViewModel()
    @StateObject private var mrAudioPlayerViewModel = AudioPlayerViewModel()
    
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
                    
                    if sampleMusicName != "음악 이름" {
                        Button(action: {
                            sampleAudioPlayerViewModel.playGeneratedMusic(music:  musicModel.generatedMusic!)
                        }) {
                            Image(systemName: sampleAudioPlayerViewModel.isPlaying ? "pause.circle" : "play.circle")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding()
                .background(Color(red: 0.8, green: 0.7, blue: 1.0))
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 1)
                )
                
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
                    
                    if mrMusicName != "음악 이름" {
                        Button(action: {
                            mrAudioPlayerViewModel.playOrPause()
                        }) {
                            Image(systemName: mrAudioPlayerViewModel.isPlaying ? "pause.circle" : "play.circle")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding()
                .background(Color(red: 0.8, green: 0.7, blue: 1.0))
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 1)
                )
                
                Spacer()
                
                // MusicPlayView로 이동하는 링크
                NavigationLink(destination: MusicPlayView()
                    .environmentObject(musicModel)
                    .environmentObject(sampleAudioPlayerViewModel)
                    .onAppear {
                        musicModel.upload(file1: Music(name: "", data: Data(count: 100)), file2: Music(name: "", data: Data(count: 100)))
                    }
                ) {
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
        .sheet(isPresented: $showFilePicker) {
            DocumentPicker(allowedTypes: ["public.audio"]) { result in
                switch result {
                case .success(let urls):
                    guard let url = urls.first else { return }
                    
                    let fileName = url.lastPathComponent
                    
                    if isSampleSelected {
                        sampleMusicName = fileName
                        sampleAudioPlayerViewModel.initializePlayer(with: url)
                        musicModel.sampleMusic = Music(name: "", data: try! Data(contentsOf: url))
                    } else {
                        mrMusicName = fileName
                        mrAudioPlayerViewModel.initializePlayer(with: url)
                        musicModel.targetMusic = Music(name: "", data: try! Data(contentsOf: url))
                    }
                    
                case .failure(let error):
                    print("Error selecting file: \(error.localizedDescription)")
                }
            }
        }
    }
}

struct MusicSelectView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MusicSelectView().environmentObject(MusicModel())
        }

    }
}
