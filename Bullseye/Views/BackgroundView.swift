//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Morgan Duverney on 4/15/21.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game

    var body: some View {
        VStack {
            TopView()
            Spacer()
            BottomView(game: $game)
        }
            .padding()
            .background(Color("BackgroundColor")
                            .edgesIgnoringSafeArea(.all))
    }
}

struct TopView: View {
    var body: some View {
        HStack {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            Spacer()
            RoundedImageViewStroked(systemName: "list.bullet")
        }
    }
}

struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack {
            LabelText(text: title)
            Spacer()
            RoundedRectTextView(text: text)
        }
            .frame(width: 68.0, height: 75.0)
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
