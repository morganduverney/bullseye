//
//  Game.swift
//  Bullseye
//
//  Created by Morgan Duverney on 4/9/21.
//

import Foundation

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(target - sliderValue)
        if sliderValue == target {
            return 200
        } else if difference <= 2 {
            return 150 - difference
        } else {
            return 100 - difference
        }
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}
