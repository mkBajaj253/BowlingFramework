//
//  BowlingGame.swift
//  BowlingAlley
//
//  Created by apple on 07/03/2023.
//

import Foundation

public class BowlingGame {
    
    private var rolls = [Int](repeating: 0, count: 21)
    private var currentRoll = 0

    // rolls balls
    public func roll(pinsKnockedDown: Int) {
        rolls[currentRoll] = pinsKnockedDown
        currentRoll += 1
    }

    public func score() -> Int {
        var score = 0
        var rollIndex = 0
        
        for _ in 1...10 {
            // checks if there is a strike meaning all balls knocked
            if rolls[rollIndex] == 10 {
                // we add balls knocked to the score plus additional strikeBonus
                score += 10 + rolls[rollIndex + 1] + rolls[rollIndex + 2]
                rollIndex += 1
                // Checking if there are spares
            } else if rolls[rollIndex] + rolls[rollIndex + 1] == 10 && rolls[rollIndex] != 10  {
                // Scrore plus spareBonus
                score += 10 + rolls[rollIndex + 2]
                rollIndex += 2
            } else {
                // Score plus sum of Balls in Frame
                score += rolls[rollIndex] + rolls[rollIndex + 1]
                rollIndex += 2
            }
        }
        return score
    }
    
}

