//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Joshua Sharp on 10/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class TicTacToeUITests: XCTestCase {

    //MARK: - Helper Properties
    
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    private func buttonFor(_ index: Int) -> XCUIElement {
        return app.buttons["button\(index)"]
    }
    
    private var restartButton: XCUIElement {
        return app.buttons["GameViewControllerRestartButton"]
    }
    
    private var turnLabel: XCUIElement {
        return app/*@START_MENU_TOKEN@*/.staticTexts["GameViewControllerTurnLabel"]/*[[".staticTexts[\"Player X won!\"]",".staticTexts[\"GameViewControllerTurnLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    }
    
    private enum Mark: String, Equatable {
        case x = "X"
        case o = "O"
        case empty = " "
        
        var turnString: String {
            switch self {
            case .x: return "Player X's turn"
            case .o: return "Player O's turn"
            case .empty: return " "
            }
        }
        
        var winString: String {
            switch self {
            case .x: return "Player X won!"
            case .o: return "Player O won!"
            case .empty: return " "
            }
        }
        
    }
    
    //MARK: - Tests
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        app/*@START_MENU_TOKEN@*/.buttons["button0"]/*[[".buttons[\"Top Left\"]",".buttons[\"button0\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["button4"]/*[[".buttons[\"Center\"]",".buttons[\"button4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["button1"]/*[[".buttons[\"Top Center\"]",".buttons[\"button1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["button5"]/*[[".buttons[\"Center Right\"]",".buttons[\"button5\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["button2"]/*[[".buttons[\"Top Right\"]",".buttons[\"button2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
        XCTAssertEqual(app/*@START_MENU_TOKEN@*/.staticTexts["GameViewControllerTurnLabel"]/*[[".staticTexts[\"Player X won!\"]",".staticTexts[\"GameViewControllerTurnLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.label, "Player X won!")
    }

    func testCleanLaunch() {
        XCTAssertEqual(app/*@START_MENU_TOKEN@*/.staticTexts["GameViewControllerTurnLabel"]/*[[".staticTexts[\"Player X won!\"]",".staticTexts[\"GameViewControllerTurnLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.label, Mark.x.turnString)
    }
    
    func testWinCheckingVerticle1() {
        let button0 = buttonFor(0)
        let button1 = buttonFor(1)
        let button3 = buttonFor(3)
        let button4 = buttonFor(4)
        let button6 = buttonFor(6)
        
        button0.tap()
        XCTAssertEqual(button0.label, Mark.x.rawValue)
        XCTAssertEqual(turnLabel.label, Mark.o.turnString)
        
        button1.tap()
        XCTAssertEqual(button1.label, Mark.o.rawValue)
        XCTAssertEqual(turnLabel.label, Mark.x.turnString)
        
        button3.tap()
        XCTAssertEqual(button3.label, Mark.x.rawValue)
        XCTAssertEqual(turnLabel.label, Mark.o.turnString)
        
        button4.tap()
        XCTAssertEqual(button4.label, Mark.o.rawValue)
        XCTAssertEqual(turnLabel.label, Mark.x.turnString)
        
        button6.tap()
        XCTAssertEqual(button6.label, Mark.x.rawValue)
        XCTAssertEqual(turnLabel.label, Mark.x.winString)
    }
    
    func testRestartingGame() {
        let button4 = buttonFor(4)
        button4.tap()
        XCTAssertEqual(button4.label, Mark.x.rawValue)
        XCTAssertEqual(turnLabel.label, Mark.o.turnString)
        restartButton.tap()
        XCTAssertEqual(turnLabel.label, Mark.x.turnString)
        
        for index in 0...8 {
            XCTAssertEqual(buttonFor(index).label, Mark.empty.rawValue)
        }
    }
}
