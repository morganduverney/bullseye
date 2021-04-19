//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Morgan Duverney on 4/18/21.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderboardIsPresented: Bool
    @Binding var game: Game
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                HeaderView(leaderboardIsPresented: $leaderboardIsPresented)
                    .padding(.bottom, 10)
                LabelView()
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(game.leaderboardEntries.indices) { i in
                            let leaderboardEntry = game.leaderboardEntries[i]
                            RowView(index: i+1, score: leaderboardEntry.score, date: leaderboardEntry.date)
                        }
                    }
                }
            }
            .frame(maxWidth: 500)
            .padding()
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score).frame(width: Constants.General.scoreColumnWidth)
            Spacer()
            DateText(date: date).frame(width: Constants.General.dateColumnWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: 100)
                .strokeBorder(Color("RowStrokeColor"), lineWidth: Constants.General.strokeLineWidth)
            )
    }
}

struct HeaderView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Binding var leaderboardIsPresented: Bool
    
    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    TitleText(text: "Leaderboard").padding(.trailing, Constants.General.roundedViewHeight)
                } else {
                    TitleText(text: "Leaderboard")
                }
            }
            HStack {
                Spacer()
                Button(action: {leaderboardIsPresented = false}) {
                    RoundedImageViewFilled(systemName: "xmark")
                }
            }
        }
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer().frame(width: Constants.General.roundedViewHeight)
            Spacer()
            RowHeaderText(text: "Score").frame(width: Constants.General.scoreColumnWidth)
            Spacer()
            RowHeaderText(text: "Date").frame(width: Constants.General.dateColumnWidth)
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static private var leaderboardIsPresented = Binding.constant(false)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        LeaderboardView(leaderboardIsPresented: leaderboardIsPresented, game: game)
        LeaderboardView(leaderboardIsPresented: leaderboardIsPresented, game: game).previewLayout(.fixed(width: 568, height: 320))
        LeaderboardView(leaderboardIsPresented: leaderboardIsPresented, game: game).preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        LeaderboardView(leaderboardIsPresented: leaderboardIsPresented, game: game).preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/).previewLayout(.fixed(width: 568, height: 320))
    }
}
