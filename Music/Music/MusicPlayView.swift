import SwiftUI

struct MusicPlayView: View {
    @EnvironmentObject var musicModel: MusicModel
    
    var body: some View {
        ZStack {
            if musicModel.isLoading {
                Color.gray.ignoresSafeArea().opacity(0.6)
                
                VStack {
                    ProgressView()
                    Text("음악이 로딩중입니다.")
                        .padding()
                }
            }
            
            
            VStack(spacing: 20) {

                HStack(spacing: 40) {

                    Button(action: {}) {
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
        MusicPlayView().environmentObject(MusicModel())
    }
}
