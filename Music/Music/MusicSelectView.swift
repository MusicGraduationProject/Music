import SwiftUI

struct MusicSelectView: View {
    @EnvironmentObject var musicModel: MusicModel
    @State private var showFilePicker = false // 파일 선택기 표시 여부
    
    var body: some View {
        VStack {
            
            VStack {
                HStack {
                    
                    Text("sample")
                    Spacer()
                    Button(action: {
                        showFilePicker.toggle()
                    }, label: {
                        /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    })
                }
                
                HStack {
                    Spacer()
                    Text("음악이름")
                }
            }
            .padding()
            .border(.black)
            
            
            VStack {
                HStack {
                    
                    Text("mr")
                    Spacer()
                    Button(action: {
                        showFilePicker.toggle()
                    }, label: {
                        /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                    })
                }
                
                HStack {
                    Spacer()
                    Text("음악이름")
                }
            }
            .padding()
            .border(.black)
            
            Spacer()
            
            
            Spacer()
            
            
            NavigationLink(destination: MusicPlayView()
                .environmentObject(musicModel)) {
                ZStack {
                    Capsule()
                        .frame(width: 300, height: 50)
                    Text("Music Play")
                        .foregroundColor(.white)
                }
            }
        }
        .padding()
        .sheet(isPresented: $showFilePicker) {
            DocumentPicker(allowedTypes: ["mp3", "wav"]) { url in
                // Handle selected file URL
                print("Selected file URL: \(url)")
                // 추가 로직: MIDI 파일 업로드 처리
            }
        }
    }
}

#Preview {
    NavigationView {
        MusicSelectView()
            .environmentObject(MusicModel())
    }
}
