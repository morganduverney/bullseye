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
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
            .padding()
            .background(RingView())
    }
}

struct TopView: View {
    @Binding var game: Game
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        HStack {
            Button(action: {
                game.restart()
            }) {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            RoundedImageViewFilled(systemName: "list.bullet")
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

struct RingView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            ForEach(1..<6) { ring in
                let size = CGFloat(ring * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(RadialGradient(gradient: Gradient(colors: [Color("RingColor").opacity(opacity * 0.8), Color("RingColor").opacity(0)]), center: .center, startRadius: 50, endRadius: 300))
                    .frame(width: size, height: size)
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BackgroundView(game: .constant(Game()))
            BackgroundView(game: .constant(Game()))
                .preferredColorScheme(.dark)
        }
    }
}
