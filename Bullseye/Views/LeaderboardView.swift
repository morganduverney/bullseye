//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Morgan Duverney on 4/18/21.
//

import SwiftUI

struct LeaderboardView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                HeaderView()
                LabelView()
                RowView(index: 1, score: 200, date: Date())
            }
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
    var body: some View {
        ZStack {
            TitleText(text: "Leaderboard")
            HStack {
                Spacer()
                RoundedImageViewFilled(systemName: "xmark").padding(.trailing, 50)
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
    static var previews: some View {
        LeaderboardView().previewLayout(.fixed(width: 568, height: 320))
    }
}
