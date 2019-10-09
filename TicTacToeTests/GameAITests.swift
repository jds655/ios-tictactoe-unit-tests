//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {
    
    func testWinCheckingVertical1() {
        var board = GameBoard()
        /*
        x o -
        x o -
        x - -
        */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 2))
        XCTAssertTrue(checkGame(board: board, isWonBy: .x))
        XCTAssertFalse(checkGame(board: board, isWonBy: .o))
    }
    
    func testWinCheckingVertical2() {
        var board = GameBoard()
        /*
         x o -
         x o -
         - o -
         */
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 2))
        XCTAssertTrue(checkGame(board: board, isWonBy: .o))
        XCTAssertFalse(checkGame(board: board, isWonBy: .x))
    }
    
    func testWinCheckingHorizontal1() {
        /*
         x x x
         o o -
         - - -
         */
        var board = GameBoard()
        try! board.place(mark: .x, on: (0,0))
        try! board.place(mark: .x, on: (1,0))
        try! board.place(mark: .x, on: (2,0))
        try! board.place(mark: .o, on: (1,1))
        try! board.place(mark: .o, on: (2,1))
        XCTAssertTrue(checkGame(board: board, isWonBy: .x))
        XCTAssertFalse(checkGame(board: board, isWonBy: .o))
    }
    
    func testWinCheckingHorizontal2 () {
        /*
         x x -
         o o o
         - - -
         */
        var board = GameBoard()
        try! board.place(mark: .x, on: (0,0))
        try! board.place(mark: .x, on: (1,0))
        try! board.place(mark: .o, on: (0,1))
        try! board.place(mark: .o, on: (1,1))
        try! board.place(mark: .o, on: (2,1))
        XCTAssertTrue(checkGame(board: board, isWonBy: .o))
        XCTAssertFalse(checkGame(board: board, isWonBy: .x))
    }
    
    func testWinCheckingHorizontal3 () {
        /*
         - x -
         - x -
         o o o
         */
        var board = GameBoard()
        try! board.place(mark: .x, on: (1,0))
        try! board.place(mark: .x, on: (1,1))
        try! board.place(mark: .o, on: (0,2))
        try! board.place(mark: .o, on: (1,2))
        try! board.place(mark: .o, on: (2,2))
        XCTAssertTrue(checkGame(board: board, isWonBy: .o))
        XCTAssertFalse(checkGame(board: board, isWonBy: .x))
    }
    
    func testWinCheckingDiagonalLTR() {
        var board = GameBoard()
        /*
         x - -
         - x -
         o o x
         */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .x, on: (2, 2))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .o, on: (1, 2))
        XCTAssertTrue(checkGame(board: board, isWonBy: .x))
        XCTAssertFalse(checkGame(board: board, isWonBy: .o))
    }
    
    func testWinCheckingDiagonalRTL() {
        var board = GameBoard()
        /*
         x - o
         - o -
         o x -
         */
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (1, 2))
        XCTAssertTrue(checkGame(board: board, isWonBy: .o))
        XCTAssertFalse(checkGame(board: board, isWonBy: .x))
    }
    
    func testCatsGame() {
        var board = GameBoard()
        /*
         x o x
         x o o
         o x x
         */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .o, on: (2, 1))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertFalse(checkGame(board: board, isWonBy: .o))
        XCTAssertFalse(checkGame(board: board, isWonBy: .x))
        XCTAssertTrue(board.isFull)
    }
    
    func testIncompleteGame() {
        var board = GameBoard()
        /*
         x - o
         - o -
         - x -
         */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (1, 2))
        XCTAssertFalse(checkGame(board: board, isWonBy: .o))
        XCTAssertFalse(checkGame(board: board, isWonBy: .x))
        XCTAssertFalse(board.isFull)
    }
}
