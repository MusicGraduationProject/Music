import SwiftUI

@main
struct MusicApp: App {
    @StateObject private var musicModel = MusicModel()  // MusicModel 인스턴스 생성

    var body: some Scene {
        WindowGroup {
            NavigationView {
                WelcomePage()
                    .environmentObject(musicModel)  // MusicModel을 environmentObject로 전달
            }
        }
    }
}
