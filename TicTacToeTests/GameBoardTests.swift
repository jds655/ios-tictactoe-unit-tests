//
//  GaomBoardTests.swift
//  TicTacToeTests
//
//  Created by Joshua Sharp on 10/9/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameBoardTests: XCTestCase {

    func testCreatingEmptyBoard() {
        let board = GameBoard()
        
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssert(board[(x, y)] == nil, "The board is not empty when created")
            }
        }
    }

    func testPlacingMarks() {
        var board = GameBoard()
        
        XCTAssertNoThrow(try board.place(mark: .o, on: (0, 0)))
        XCTAssertEqual(board[(0,0)], .o)
        XCTAssertNoThrow(try board.place(mark: .x, on: (2, 2)))
        XCTAssertEqual(board[(2,2)], .x)
        for x in 0..<3 {
            for y in 0..<3 {
                if x == 0 && y == 0 {continue}
                if x == 2 && y == 2 {continue}
                XCTAssertNil(board[(x, y)])
            }
        }
        XCTAssertThrowsError(try board.place(mark: .x, on: (0, 0))) { (error) in
            XCTAssertEqual(error as? GameBoardError, GameBoardError.invalidSquare)
        }
    }
    
    func testIsFull() {
        var board = GameBoard()
        
        try! board.place(mark: .x, on: (0,0))
        try! board.place(mark: .o, on: (0,1))
        try! board.place(mark: .x, on: (0,2))
        try! board.place(mark: .o, on: (1,0))
        try! board.place(mark: .x, on: (1,1))
        try! board.place(mark: .o, on: (1,2))
        try! board.place(mark: .x, on: (2,0))
        try! board.place(mark: .o, on: (2,1))
        XCTAssertFalse(board.isFull)
        try! board.place(mark: .x, on: (2,2))
        XCTAssertTrue(board.isFull)
    }
}
