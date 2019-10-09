//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
    //Check verticals
    for x in 0..<3 {
        var numMarks = 0
        for y in 0..<3 {
            if board[(x,y)] == player {
                numMarks += 1
            }
            if numMarks == 3 {
                return true
            }
        }
    }
    //Check Horizontals
    for y in 0..<3 {
        var numMarks = 0
        for x in 0..<3 {
            if board[(x,y)] == player {
                numMarks += 1
            }
            if numMarks == 3 {
                return true
            }
        }
    }
    //Check Diagonal from LTR
    var x = 0
    var y = 0
    var numMarks = 0
    while x <= 2 && y <= 2 {
        if board[(x,y)] == player {
            numMarks += 1
        }
        x += 1
        y += 1
    }
    if numMarks == 3 {
        return true
    }
    
    //Checking Diagonal RTL
    let rtl: [Coordinate] = [(2,0),(1,1),(0,2)]
    var matched = true
    for coord in rtl {
        if board[coord] != player {
            matched = false
        }
    }
    if matched {return true}
    return false
}
