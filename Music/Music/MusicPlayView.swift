//
//import SwiftUI
//import AVFoundation
//import UniformTypeIdentifiers
//
//struct MusicPlayView: View {
//
//    @State private var isRecording = false
//    @State private var audioRecorder: AVAudioRecorder?
//    @State private var audioPlayer: AVAudioPlayer?
//
//    var body: some View {
//        VStack(spacing: 20) {
//            // Record Button
//            Button(action: {
//                if isRecording {
//                    stopRecording()
//                } else {
//                    startRecording()
//                }
//            }) {
//                Image(systemName: "record.circle")
//                    .resizable()
//                    .frame(width: 80, height: 80)
//                    .foregroundColor(.red)
//            }
//
//            // Play and Save Buttons
//            HStack(spacing: 40) {
//                Button(action: playRecording) {
//                    Image(systemName: "play.circle")
//                        .resizable()
//                        .frame(width: 40, height: 40)
//                }
//                Button(action: saveRecording) {
//                    Image(systemName: "square.and.arrow.down")
//                        .resizable()
//                        .frame(width: 40, height: 40)
//                }
//            }
//
//            Spacer()
//
//            // Result Button
//            Button(action: showResult) {
//                VStack {
//                    Image(systemName: "music.note.list")
//                        .resizable()
//                        .frame(width: 40, height: 40)
//                    Text("Result")
//                        .font(.caption)
//                }
//            }
//            .padding(.bottom, 20)
//        }
//        .padding()
//        .onAppear(perform: setupRecorder)
//    }
//
//    // MARK: - Functions
//
//    func setupRecorder() {
//        // Configure audio session and prepare for recording
//    }
//
//    func startRecording() {
//        isRecording = true
//        // Start audio recording logic here
//    }
//
//    func stopRecording() {
//        isRecording = false
//        // Stop audio recording logic here
//    }
//
//    func playRecording() {
//        // Audio playback logic here
//    }
//
//    func saveRecording() {
//        // Saving recording logic here
//    }
//
//    func showResult() {
//        // Show result functionality here
//    }
//}
//
//#Preview {
//    MusicPlayView()
//}
//


import SwiftUI
import AVFoundation
import UniformTypeIdentifiers

struct MusicPlayView: View {
    
    @State private var isRecording = false
    @State private var audioRecorder: AVAudioRecorder?
    @State private var audioPlayer: AVAudioPlayer?
    @State private var selectedFileURL: URL? // 선택된 파일 URL
    
    var body: some View {
        VStack(spacing: 20) {
            // Record Button
            Button(action: {
                if isRecording {
                    stopRecording()
                } else {
                    startRecording()
                }
            }) {
                Image(systemName: "record.circle")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.red)
            }
            
            // Play and Save Buttons
            HStack(spacing: 40) {
                Button(action: playRecording) {
                    Image(systemName: "play.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                Button(action: saveRecording) {
                    Image(systemName: "square.and.arrow.down")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
            }

            Spacer()

            // Result Button
            Button(action: showResult) {
                VStack {
                    Image(systemName: "music.note.list")
                        .resizable()
                        .frame(width: 40, height: 40)
                    Text("Result")
                        .font(.caption)
                }
            }
            .padding(.bottom, 20)
        }
        .padding()
        .onAppear(perform: setupRecorder)
    }
    
    // MARK: - Functions
    
    func setupRecorder() {
        // Configure audio session and prepare for recording
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default)
            try audioSession.setActive(true)
        } catch {
            print("Failed to set up audio session: \(error)")
        }
    }
    
    func startRecording() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatAppleLossless),
            AVSampleRateKey: 44100,
            AVNumberOfChannelsKey: 2,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder?.record()
            isRecording = true
        } catch {
            print("Failed to start recording: \(error)")
        }
    }
    
    func stopRecording() {
        audioRecorder?.stop()
        audioRecorder = nil
        isRecording = false
    }
    
    func playRecording() {
        guard let url = selectedFileURL else {
            print("No file selected for playback")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Failed to play recording: \(error)")
        }
    }
    
    func saveRecording() {
        guard let url = selectedFileURL else {
            print("No file selected for saving")
            return
        }
        
        let fileManager = FileManager.default
        let destinationURL = getDocumentsDirectory().appendingPathComponent(url.lastPathComponent)

        do {
            if fileManager.fileExists(atPath: destinationURL.path) {
                try fileManager.removeItem(at: destinationURL)
            }
            try fileManager.copyItem(at: url, to: destinationURL)
            print("File saved to: \(destinationURL)")
        } catch {
            print("Failed to save recording: \(error)")
        }
    }
    
    func showResult() {
        // Show result functionality here
    }

    func getDocumentsDirectory() -> URL {
        // Get the document directory URL
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

#Preview {
    MusicPlayView()
}
