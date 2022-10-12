//
//  Tic_Tac_ToeTests.swift
//  Tic Tac ToeTests
//
//  Created by Purvesh Dodiya on 27/03/22.
//

import XCTest
@testable import Tic_Tac_Toe

class Tic_Tac_ToeTests: XCTestCase {
    private var gameZone: GameZoneVC!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        gameZone = GameZoneVC()
        gameZone.arrayOfNine[BoxName.gameOne.rawValue] = "ONE"
        gameZone.arrayOfNine[BoxName.gameTwo.rawValue] = "ONE"
        gameZone.arrayOfNine[BoxName.gameThree.rawValue] = "ONE"
        
        gameZone.arrayOfNine[BoxName.gameFour.rawValue] = "gameFour"
        gameZone.arrayOfNine[BoxName.gameFive.rawValue] = "gameFive"
        gameZone.arrayOfNine[BoxName.gameSix.rawValue] = "gameSix"
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        //It should return true as three is same
        XCTAssertTrue(gameZone.isThreeSame(firstBox: .gameOne, secondBox: .gameTwo, thirdBox: .gameThree))
        
        //It should return false as three is not same
        XCTAssertFalse(gameZone.isThreeSame(firstBox: .gameFour, secondBox: .gameFive, thirdBox: .gameSix))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
