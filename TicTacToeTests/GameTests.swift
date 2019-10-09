//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Joshua Sharp on 10/9/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testGameRestart() {
        var game = Game()
        let coord = (0,0)
        
        XCTAssertNoThrow(try game.makeMark(at: coord))
        game.restart()
        XCTAssertEqual(game.activePlayer, .x)
        XCTAssertNil(game.winningPlayer)
        XCTAssertFalse(game.gameIsOver)
        //I know reset resets the board as the next would fail otherwise
        XCTAssertNoThrow(try game.makeMark(at: coord))
    }

    func testMakeMark() {
        var game = Game()
        let coord = (0,0)
        
        XCTAssertNoThrow(try game.makeMark(at: coord))
        XCTAssertEqual(game.activePlayer, .o)
        XCTAssertThrowsError(try game.makeMark(at: coord)) { (error) in
            XCTAssertEqual(error as? GameBoardError, GameBoardError.invalidSquare)
        }
        
    }
}
