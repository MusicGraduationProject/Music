
import SwiftUI
import AVFoundation

struct MusicSelectView: View {
    @EnvironmentObject var musicModel: MusicModel
    @State private var showFilePicker = false
    @State private var sampleMusicName: String = ""
    @State private var mrMusicName: String = ""
    @State private var isSampleSelected = true
    
    @State private var sampleImageURL: URL?
    @State private var mrImageURL: URL?
    
    @StateObject private var sampleAudioPlayerViewModel = AudioPlayerViewModel()
    @StateObject private var mrAudioPlayerViewModel = AudioPlayerViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            ScrollView {
                // Sample 섹션
                VStack(spacing: 10) {
                    // 제목 섹션
                    HStack {
                        Label("Sample 음악을 골라주세요.", systemImage: "music.note")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.leading)
                        
                        Spacer()
                    }
                    
                    // 음악 이름 표시
                    HStack {
                        Spacer()
                        Text(sampleMusicName)
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding(.trailing)
                    }
                    
                    // 이미지 및 선택 버튼
                    if self.sampleImageURL == nil {
                        Button(action: {
                            isSampleSelected = true
                            showFilePicker.toggle()
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 30)
                                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 4, dash: [10]))
                                    .frame(width: 180, height: 180)
                                    .shadow(color: Color.purple.opacity(0.3), radius: 10, x: 0, y: 8)
                                
                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.blue)
                            }
                        }
                    } else {
                        AsyncImage(url: self.sampleImageURL) { phase in
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
                    }
                    
                    // 재생 버튼
                    if sampleMusicName != "" {
                        Button(action: {
                            sampleAudioPlayerViewModel.playOrPause()
                        }) {
                            Image(systemName: sampleAudioPlayerViewModel.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.white)
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                        }
                        .padding(.top, 10)
                    }
                }
                .padding(30)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .shadow(color: Color.purple.opacity(0.5), radius: 15, x: 0, y: 10)
                )
                .padding()
                
                VStack(spacing: 20) {
                    // 제목 섹션
                    HStack {
                        Label("MR을 골라주세요.", systemImage: "music.note")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.leading)
                        
                        Spacer()
                    }
                    
                    // 음악 이름 표시
                    HStack {
                        Spacer()
                        Text(mrMusicName)
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding(.trailing)
                    }
                    
                    // 이미지 및 선택 버튼
                    if self.mrImageURL == nil {
                        Button(action: {
                            isSampleSelected = false
                            showFilePicker.toggle()
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 30)
                                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 4, dash: [10]))
                                    .frame(width: 180, height: 180)
                                    .shadow(color: Color.purple.opacity(0.3), radius: 10, x: 0, y: 8)
                                
                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.blue)
                            }
                        }
                    } else {
                        AsyncImage(url: self.mrImageURL) { phase in
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
                    }
                    
                    // 재생 버튼
                    if mrMusicName != "" {
                        Button(action: {
                            mrAudioPlayerViewModel.playOrPause()
                        }) {
                            Image(systemName: mrAudioPlayerViewModel.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.white)
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                        }
                        .padding(.top, 10)
                    }
                }
                .padding(30)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.7)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .shadow(color: Color.purple.opacity(0.5), radius: 15, x: 0, y: 10)
                )
                .padding()
                
                Spacer()
                
                
                Rectangle()
                    .frame(height: 100)
                    .foregroundColor(.clear)
            }
            .padding()
            .scrollIndicators(.hidden)
            
            
            // MusicPlayView로 이동하는 링크
            VStack {
                Spacer()
                NavigationLink(destination: MusicPlayView()
                    .environmentObject(musicModel)
                    .environmentObject(sampleAudioPlayerViewModel)
                    .onAppear {
                        musicModel.upload(
                            file1: musicModel.sampleMusic!,
                            file2: musicModel.targetMusic!)
                    }
                ) {
                    ZStack {
                        Text("Music Generate")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal, 30)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .leading, endPoint: .trailing)
                            )
                            .cornerRadius(20)
                            .shadow(color: Color.blue.opacity(0.4), radius: 10, x: 0, y: 5)
                    }
                }
            }
            
        }
        .sheet(isPresented: $showFilePicker) {
            DocumentPicker(allowedTypes: ["public.audio"]) { result in
                switch result {
                case .success(let urls):
                    guard let url = urls.first else { return }
                    
                    let fileName = url.lastPathComponent
                    
                    if isSampleSelected {
                        if let coverImage = fetchCoverImage(from: url) {
                            if let savedURL = saveImageTemporarily(coverImage) {
                                print("임시 파일 위치:", savedURL)
                                self.sampleImageURL = savedURL
                            }
                        } else {
                            print("커버 이미지를 찾을 수 없습니다.")
                        }
                        sampleMusicName = fileName
                        sampleAudioPlayerViewModel.initializePlayer(with: url)
                        musicModel.sampleMusic = Music(name: "", data: try! Data(contentsOf: url))
                    } else {
                        if let coverImage = fetchCoverImage(from: url) {
                            if let savedURL = saveImageTemporarily(coverImage) {
                                print("임시 파일 위치:", savedURL)
                                self.mrImageURL = savedURL
                            }
                        } else {
                            print("커버 이미지를 찾을 수 없습니다.")
                        }
                        mrMusicName = fileName
                        mrAudioPlayerViewModel.initializePlayer(with: url)
                        musicModel.targetMusic = Music(name: "", imageUrl: self.mrImageURL, data: try! Data(contentsOf: url))
                    }
                    
                case .failure(let error):
                    print("Error selecting file: \(error.localizedDescription)")
                }
            }
        }
    }
}

func fetchCoverImage(from filePath: URL) -> UIImage? {
    // AVAsset 생성
    let asset = AVAsset(url: filePath)
    
    // 메타데이터에서 커버 이미지를 포함하는 항목 찾기
    for metadata in asset.commonMetadata {
        if metadata.commonKey == .commonKeyArtwork,
           let data = metadata.value as? Data,
           let image = UIImage(data: data) {
            return image // 커버 이미지 반환
        }
    }
    return nil // 커버 이미지가 없을 경우 nil 반환
}

// 예시: 임시 디렉터리 활용
func saveImageTemporarily(_ image: UIImage) -> URL? {
    let tempDirectory = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
    let fileURL = tempDirectory.appendingPathComponent("temp_thumbnail.png")
    
    do {
        if let pngData = image.pngData() {
            try pngData.write(to: fileURL)
            return fileURL
        }
    } catch {
        print("임시 디렉터리에 이미지 저장 실패:", error)
    }
    return nil
}

struct MusicSelectView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MusicSelectView().environmentObject(MusicModel())
        }
        
    }
}
