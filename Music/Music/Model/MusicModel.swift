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

enum PATH: String {
    case upload = "/upload"
}

class MusicModel: ObservableObject {
    
    @Published var player: AVAudioPlayer = AVAudioPlayer()
    
    @Published var sampleMusic: Music? = nil
    @Published var targetMusic: Music? = nil
    @Published var generatedMusic: Music? = nil
    
    @Published var isLoading: Bool = false
    @Published var loadingDone: Bool = false
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
    
    func upload(file1: Music, file2: Music) {
        do {
            DispatchQueue.main.async { self.isLoading = true }
            
            let fileData1 = file1.data.base64EncodedString()
            let fileData2 = file2.data.base64EncodedString()
            let parameters: [String: Any] = [
                "file1": fileData1,
                "file2": fileData2
            ]
            
            let realURL = self.url + PATH.upload.rawValue
            var request = URLRequest(url: URL(string: realURL)!)
            request.httpMethod = METHOD.POST.rawValue
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: [])
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Upload failed with error: \(error)")
                    return
                }
                if let data = data {
                    let musicDto = try! JSONDecoder().decode(MusicDTO.self, from: data)
                    let music = Music(name: "", data: Data(base64Encoded: musicDto.resultFile) ?? Data())
                    
                    print(musicDto)
                    DispatchQueue.main.async {
                        self.isLoading = false
                        self.loadingDone = true
                        self.generatedMusic = music
                    }
                    
                } else {
                    print("Failed to decode response.")
                }
            }
            
            task.resume()
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
}
