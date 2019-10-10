//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Joshua Sharp on 10/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class TicTacToeUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element
        let element3 = element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element
        let element2 = element3.children(matching: .other).element(boundBy: 0)
        let button = element2.children(matching: .button).matching(identifier: " ").element(boundBy: 0)
        button.tap()
        
        let button2 = element3.children(matching: .other).element(boundBy: 1).children(matching: .button).matching(identifier: " ").element(boundBy: 1)
        button2.tap()
        button.tap()
        button2.tap()
        element2.buttons[" "].tap()
        element.tap()
        app.staticTexts["Player X won!"].tap()
        app.buttons["Restart"].tap()
        
    }

}
