import AVFoundation

class AudioPlayerViewModel: ObservableObject {
    var audioPlayer: AVAudioPlayer?
    @Published var isPlaying = false
    
    // 오디오 파일 URL로 초기화
    func initializePlayer(with url: URL) {
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: url)
            self.audioPlayer?.prepareToPlay()
        } catch {
            print("오디오 플레이어 초기화 실패: \(error.localizedDescription)")
        }
    }
    
    // 음악 재생 및 일시정지
    func playOrPause() {
        guard let player = audioPlayer else { return }
        if player.isPlaying {
            player.pause()
            isPlaying = false
        } else {
            player.play()
            isPlaying = true
        }
    }
    
    func playGeneratedMusic(music: Music) {
        do {
            self.audioPlayer = try AVAudioPlayer(data: music.data)
            self.audioPlayer?.prepareToPlay()
        } catch let error {
            print(error.localizedDescription)
        }
        
        guard let player = self.audioPlayer else { return }
        if player.isPlaying {
            player.pause()
            isPlaying = false
        } else {
            player.play()
            isPlaying = true
        }
    }
    
    
}
