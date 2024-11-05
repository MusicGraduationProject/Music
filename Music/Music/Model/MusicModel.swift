//
//  MusicModel.swift
//  Music
//
//  Created by 박성수 on 10/31/24.
//

import Foundation
import AVFoundation

enum TYPE: String {
    case mp3
    case wav
}

enum METHOD: String {
    case GET
    case POST
}

class MusicModel: ObservableObject {
    
    @Published var player: AVAudioPlayer = AVAudioPlayer()
    
    @Published var baseRythm: Music? = nil
    @Published var targetMusic: Music? = nil
    @Published var generatedMusic: Music? = nil
    private var url: String = ""
    
    init() {
        if let bundle = Bundle.main.url(forResource: "maininfo", withExtension: "plist") {
            let dic = try! NSDictionary(contentsOf: bundle, error: ())
            let url = dic["url"] as? String ?? ""
            self.url = url
        } else {
            print("fail to load bundle")
        }
    }
    
    func upload(file1: Music, file2: Music, completionHandler: @escaping((Music) -> Void)) {
        
        do {
            let fileData1 = try? Data(contentsOf: URL(string: file1.url)!).base64EncodedString()
            let fileData2 = try? Data(contentsOf: URL(string: file2.url)!).base64EncodedString()
            
            let realURL = self.url + "?file1=\(fileData1)&file2=\(fileData2)"
            var request = URLRequest(url: URL(string: realURL)!)
            request.httpMethod = METHOD.POST.rawValue
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
//            let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: [])
//            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Upload failed with error: \(error)")
                    return
                }
                
                if let data = data, let decodedURL = try? JSONDecoder().decode(String.self, from: data) {
                    let music = Music(name: "", url: decodedURL)
                    completionHandler(music)
                } else {
                    print("Failed to decode response.")
                }
            }
            task.resume()
        }
        
    }
    
    func musicPlay(music: Music) {
        
        // MARK: - 실제 파일을 가지고 있는 경우
        if let musicURL = Bundle.main.url(forResource: music.url, withExtension: TYPE.wav.rawValue) {
            do {
                self.player = try AVAudioPlayer(contentsOf: musicURL)
                self.player.play()
            } catch {
                print("음악 재생 중 오류 발생: \(error.localizedDescription)")
            }
        } else {
            print("음악 파일을 찾을 수 없습니다.")
        }
    }
    
}
