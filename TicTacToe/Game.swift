//
//  Game.swift
//  TicTacToe
//
//  Created by Joshua Sharp on 10/9/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

enum GameError: Error, Equatable {
    case noActivePlayer
    case boardIsFull
}

struct Game {
    private(set) var board: GameBoard
    
    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    
    init() {
        activePlayer = .x
        winningPlayer = nil
        board = GameBoard()
        gameIsOver = false
    }
    
    mutating internal func restart() {
        self.activePlayer = .x
        self.winningPlayer = nil
        self.board = GameBoard()
        self.gameIsOver = false
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let activePlayer = activePlayer else {
            throw GameError.noActivePlayer
        }
        do {
            try board.place(mark: activePlayer, on: coordinate)
        } catch {
            throw error
        }
        
        if checkGame(board: board, isWonBy: activePlayer) {
            self.winningPlayer = activePlayer
            self.activePlayer = nil
            self.gameIsOver = true
            return
        } else {
            if activePlayer == .x { self.activePlayer = .o}
            else {self.activePlayer = .x}
            if !checkGame(board: board, isWonBy: activePlayer) && board.isFull
            {
                self.gameIsOver = true
                self.winningPlayer = nil
                self.activePlayer = nil
                //throw GameError.boardIsFull
            }
        }
    }
    
    
}
