import SwiftUI
import AVFoundation
import UniformTypeIdentifiers

struct MusicPlayView: View {
    @EnvironmentObject var musicModel: MusicModel
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Play and Save Buttons
            HStack {
                Button(action: {}) {
                    Image(systemName: "play.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                
                Rectangle()
                    .frame(height: 70)
                    .cornerRadius(10)
                    .foregroundColor(.gray)
                
            }
            
            HStack(spacing: 40) {
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.down")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
            }

            Spacer()

            
            Button(action: {
                
            },
            label: {
                Text("홈으로")
            })
            
            // Result Button
            Button(action: {}) {
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
    }
}

#Preview {
    MusicPlayView()
        .environmentObject(MusicModel())
}
