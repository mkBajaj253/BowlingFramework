import XCTest
@testable import BowlingFramework

final class BowlingFrameworkTests: XCTestCase {
    
    func  testWhenAllRollsAreZero() {
        
        let game = BowlingGame()
        for _ in 1...20 {
            game.roll(pinsKnockedDown: 0)
        }
        let score = game.score()
        XCTAssertEqual(score, 0, "Score should be 0")
        
    }
    
    func testForGameWithNoStrikesOrSpares() {
        
        let game = BowlingGame()
        for _ in 1...20 {
            game.roll(pinsKnockedDown: 4)
        }
        let score = game.score()
        XCTAssertEqual(score,80, "Score should be 80")
    }
    
    func testForGameWithAllSpares() {
        
        let game = BowlingGame()
        for _ in 1...21 {
            game.roll(pinsKnockedDown: 5)
        }
        let score = game.score()
        XCTAssertEqual(score, 150, "Score should be 150")
    }
    
    func testForGameWithAllStrikes() {
        
        let game = BowlingGame()
        for _ in 1...21 {
            game.roll(pinsKnockedDown: 10)
        }
        let score = game.score()
        XCTAssertEqual(score, 300, "Score should be 300")
    }
    
    func testForAGameWithMixOfStrikesAndSpares() {
        
        let game = BowlingGame()
        game.roll(pinsKnockedDown: 5)
        game.roll(pinsKnockedDown: 5) // Spare
        game.roll(pinsKnockedDown: 10) // Strike
        game.roll(pinsKnockedDown: 7)
        game.roll(pinsKnockedDown: 3) // Spare
        game.roll(pinsKnockedDown: 0)
        game.roll(pinsKnockedDown: 0)
        game.roll(pinsKnockedDown: 10) // Strike
        game.roll(pinsKnockedDown: 10) // Strike
        game.roll(pinsKnockedDown: 10) // Strike
        game.roll(pinsKnockedDown: 8)
        game.roll(pinsKnockedDown: 1) // Spare
        let score = game.score()
        XCTAssertEqual(score, 136, "Score should be 136")

    }
    
    
}
