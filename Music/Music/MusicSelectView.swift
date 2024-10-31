import SwiftUI

struct MusicSelectView: View {
    @State private var showFilePicker = false // 파일 선택기 표시 여부

    var body: some View {
        VStack {
            NavigationLink(destination: MusicPlayView()) {
                Text("Music Play")
            }
            Button(action: { showFilePicker = true }) {
                VStack {
                    Image(systemName: "icloud.and.arrow.up")
                        .resizable()
                        .frame(width: 40, height: 40)
                    Text("Upload MIDI")
                        .font(.caption)
                }
            }
            .sheet(isPresented: $showFilePicker) {
                DocumentPicker(allowedTypes: ["mp3", "wav"]) { url in
                    // Handle selected file URL
                    print("Selected file URL: \(url)")
                    // 추가 로직: MIDI 파일 업로드 처리
                }
            }
        }
        .padding()
    }
}

#Preview {
    NavigationView {
        MusicSelectView()
    }
}
