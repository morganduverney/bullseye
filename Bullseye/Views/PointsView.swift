//
//  PointsView.swift
//  Bullseye
//
//  Created by Morgan Duverney on 4/17/21.
//

import SwiftUI

struct PointsView: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game

    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        
        VStack(spacing: 10) {
            InstructionText(text: "The slider's value is")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You scored \(points) points! \n 🎉🎉🎉")
            Button(action: {
                withAnimation() {
                    self.alertIsVisible = false
                }
                    game.startNewRound(points: points)
            }) {
                ButtonText(text: "Start New Round")
            }
        }
            .padding()
            .frame(maxWidth: 300)
            .background(Color("BackgroundColor"))
            .cornerRadius(Constants.General.cornerRadius)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 5 )
            .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        Group {
            PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
                .previewLayout(.fixed(width: 568, height: 320))
        }
    }
}
