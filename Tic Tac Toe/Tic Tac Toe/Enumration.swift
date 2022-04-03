//
//  Enumration.swift
//  Tic Tac Toe
//
//  Created by Purvesh Dodiya on 27/03/22.
//

import Foundation

//Enum
enum TypeOfTurn: String {
    case O
    case X
    case `default`
}

enum GameType {
    case online
    case ofline
}

enum BoxName: String {
    case gameOne
    case gameTwo
    case gameThree
    case gameFour
    case gameFive
    case gameSix
    case gameSeven
    case gameEight
    case gameNine
}

enum DatabaseKey: String {
    case room
    case yourName
    case opponentName
}

enum GameTurnMessage: String {
    case your = "Your turn !"
    case opponent = "'s turn !"
}
