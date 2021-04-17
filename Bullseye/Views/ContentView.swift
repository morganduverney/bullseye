//
//  ContentView.swift
//  Bullseye
//
//  Created by Morgan Duverney on 3/6/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    @State private var game: Game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionView(game: $game).padding(.bottom, 100.0)
                HitMeButtonView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
            }
            SliderView(sliderValue: $sliderValue)

        }
    }
}

struct InstructionView: View {
    @Binding  var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: "Put the bullesye as close as you can to")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderText(text: "1")
            Slider(value: self.$sliderValue, in: 1.0...100.0)
            SliderText(text: "100")
        }
            .padding()
    }
}

struct HitMeButtonView: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            self.alertIsVisible = true
        }) {
            Text("Hit me".uppercased())
                .bold()
                .font(.title3)
        }
            .padding(20.0)
            .background(ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            })
            .foregroundColor(Color("ButtonTextColor"))
            .cornerRadius(21.0)
            .overlay(RoundedRectangle(cornerRadius: 21.0).strokeBorder(Color.white, lineWidth: 2.0))
            .alert(isPresented: $alertIsVisible, content: {
                let roundedValue: Int = Int(self.sliderValue.rounded())
                let points = self.game.points(sliderValue: roundedValue)
                return Alert(title: Text("Hello there!"), message: Text("The slider's value is \(roundedValue). \n" + "You scored \(points) points this round!"), dismissButton: .default(Text("Dismiss")) {
                    game.startNewRound(points: points)
                })
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width: 568, height: 320))
        ContentView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        ContentView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/).previewLayout(.fixed(width: 568, height: 320))
    }
}
