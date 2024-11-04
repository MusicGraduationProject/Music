//
//  Untitled 2.swift
//  Music
//
//  Created by 정선우 on 11/4/24.
//
import SwiftUI

struct InvestmentCardView: View {
    var body: some View {
        ZStack {
            // 배경 카드
//            RoundedRectangle(cornerRadius: 20)
//                .fill(Color.black)
//                .frame(width: 350, height: 500)
//                .shadow(radius: 10)
            Color.black
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .leading, spacing: 20) {
                // 상단 텍스트
                Text("TOTAL INVESTMENTS")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                // 총 투자 금액
                HStack {
                    Image(systemName: "chart.bar.fill") // 아이콘 (대체 가능)
                        .foregroundColor(.white)
                    Text("6.70L")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                
                // Mutual Funds 섹션
                HStack {
                    Label("Mutual Funds", systemImage: "chart.bar.fill")
                        .foregroundColor(.white)
                    Spacer()
                    Text("4.8L")
                        .foregroundColor(.gray)
                }
                
                ProgressView(value: 0.8) // Progress bar
                    .accentColor(Color.purple)
                
                // Stocks 섹션
                HStack {
                    Label("Stocks", systemImage: "chart.line.uptrend.xyaxis")
                        .foregroundColor(.white)
                    Spacer()
                    Text("1.35L")
                        .foregroundColor(.gray)
                }
                
                ProgressView(value: 0.5) // Progress bar
                    .accentColor(Color.yellow)
                
                // Fixed Deposits 섹션
                HStack {
                    Label("MR", systemImage: "lock.fill")
                        .foregroundColor(.white)
                    Spacer()
                    Text("55K")
                        .foregroundColor(.gray)
                }
                
                ProgressView(value: 0.2) // Progress bar
                    .accentColor(Color.pink)

            }
            .padding(30) // 전체 패딩 적용
        }
    }
}

struct ContentView: View {
    var body: some View {
        InvestmentCardView()
            .padding()
            .background(Color.black) // 배경색 설정 (핑크톤)
    }
}

struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

#Preview {
    ContentView() // InvestmentCardView 대신 ContentView를 사용하여 전체 화면을 미리보기
        .previewLayout(.sizeThatFits) // 미리보기 레이아웃을 설정 (크기에 맞게 조정)
        .padding()
        .background(Color.black) // 배경색 설정
    
}

