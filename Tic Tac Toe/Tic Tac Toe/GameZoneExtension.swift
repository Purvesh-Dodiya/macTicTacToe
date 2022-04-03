//
//  GameZoneExtension.swift
//  Tic Tac Toe
//
//  Created by Purvesh Dodiya on 03/04/22.
//

import Cocoa

//MARK:- GameZone OutLet Actions
extension ViewController {
    
    @IBAction func onClickOne(_ sender: Any?) {
        if nil == arrayOfNine[BoxName.gameOne.rawValue], (sender == nil || getCurrentType() == lblYourType.stringValue) {
            buttonOne.image = isOTurn ? NSImage(systemSymbolName: "circle", accessibilityDescription: "") : NSImage(systemSymbolName: "x.circle.fill", accessibilityDescription: "")
            if (gameType == .online) {
                let createRoomRef = ref.child(DatabaseKey.room.rawValue).child(roomCode)
                createRoomRef.updateChildValues([BoxName.gameOne.rawValue: lblYourType.stringValue])
            }
            arrayOfNine[BoxName.gameOne.rawValue] = isOTurn ? TypeOfTurn.O.rawValue : TypeOfTurn.X.rawValue
            isOTurn = !isOTurn
            checkForWin()
            return
        }
    }
    @IBAction func onClickTwo(_ sender: Any?) {
        if nil == arrayOfNine[BoxName.gameTwo.rawValue], (sender == nil || getCurrentType() == lblYourType.stringValue) {
            buttonTwo.image = isOTurn ? NSImage(systemSymbolName: "circle", accessibilityDescription: "") : NSImage(systemSymbolName: "x.circle.fill", accessibilityDescription: "")
            if (gameType == .online) {
                let createRoomRef = ref.child(DatabaseKey.room.rawValue).child(roomCode)
                createRoomRef.updateChildValues([BoxName.gameTwo.rawValue: lblYourType.stringValue])
            }
            arrayOfNine[BoxName.gameTwo.rawValue] = isOTurn ? TypeOfTurn.O.rawValue : TypeOfTurn.X.rawValue
            isOTurn = !isOTurn
            checkForWin()
            return
        }
    }
    @IBAction func onClickThree(_ sender: Any?) {
        if nil == arrayOfNine[BoxName.gameThree.rawValue], (sender == nil || getCurrentType() == lblYourType.stringValue) {
            buttonThree.image = isOTurn ? NSImage(systemSymbolName: "circle", accessibilityDescription: "") : NSImage(systemSymbolName: "x.circle.fill", accessibilityDescription: "")
            if (gameType == .online) {
                let createRoomRef = ref.child(DatabaseKey.room.rawValue).child(roomCode)
                createRoomRef.updateChildValues([BoxName.gameThree.rawValue: lblYourType.stringValue])
            }
            arrayOfNine[BoxName.gameThree.rawValue] = isOTurn ? TypeOfTurn.O.rawValue : TypeOfTurn.X.rawValue
            isOTurn = !isOTurn
            checkForWin()
            return
        }
    }
    @IBAction func onClickFour(_ sender: Any?) {
        if nil == arrayOfNine[BoxName.gameFour.rawValue], (sender == nil || getCurrentType() == lblYourType.stringValue) {
            buttonFour.image = isOTurn ? NSImage(systemSymbolName: "circle", accessibilityDescription: "") : NSImage(systemSymbolName: "x.circle.fill", accessibilityDescription: "")
            if (gameType == .online) {
                let createRoomRef = ref.child(DatabaseKey.room.rawValue).child(roomCode)
                createRoomRef.updateChildValues([BoxName.gameFour.rawValue: lblYourType.stringValue])
            }
            arrayOfNine[BoxName.gameFour.rawValue] = isOTurn ? TypeOfTurn.O.rawValue : TypeOfTurn.X.rawValue
            isOTurn = !isOTurn
            checkForWin()
            return
        }
    }
    @IBAction func onClickFive(_ sender: Any?) {
        if nil == arrayOfNine[BoxName.gameFive.rawValue], (sender == nil || getCurrentType() == lblYourType.stringValue) {
            buttonFive.image = isOTurn ? NSImage(systemSymbolName: "circle", accessibilityDescription: "") : NSImage(systemSymbolName: "x.circle.fill", accessibilityDescription: "")
            if (gameType == .online) {
                let createRoomRef = ref.child(DatabaseKey.room.rawValue).child(roomCode)
                createRoomRef.updateChildValues([BoxName.gameFive.rawValue: lblYourType.stringValue])
            }
            arrayOfNine[BoxName.gameFive.rawValue] = isOTurn ? TypeOfTurn.O.rawValue : TypeOfTurn.X.rawValue
            isOTurn = !isOTurn
            checkForWin()
            return
        }
    }
    @IBAction func onClickSix(_ sender: Any?) {
        if nil == arrayOfNine[BoxName.gameSix.rawValue], (sender == nil || getCurrentType() == lblYourType.stringValue) {
            buttonSix.image = isOTurn ? NSImage(systemSymbolName: "circle", accessibilityDescription: "") : NSImage(systemSymbolName: "x.circle.fill", accessibilityDescription: "")
            if (gameType == .online) {
                let createRoomRef = ref.child(DatabaseKey.room.rawValue).child(roomCode)
                createRoomRef.updateChildValues([BoxName.gameSix.rawValue: lblYourType.stringValue])
            }
            arrayOfNine[BoxName.gameSix.rawValue] = isOTurn ? TypeOfTurn.O.rawValue : TypeOfTurn.X.rawValue
            checkForWin()
            return
        }
    }
    @IBAction func onClickSeven(_ sender: Any?) {
        if nil == arrayOfNine[BoxName.gameSeven.rawValue], (sender == nil || getCurrentType() == lblYourType.stringValue) {
            buttonSeven.image = isOTurn ? NSImage(systemSymbolName: "circle", accessibilityDescription: "") : NSImage(systemSymbolName: "x.circle.fill", accessibilityDescription: "")
            if (gameType == .online) {
                let createRoomRef = ref.child(DatabaseKey.room.rawValue).child(roomCode)
                createRoomRef.updateChildValues([BoxName.gameSeven.rawValue: lblYourType.stringValue])
            }
            arrayOfNine[BoxName.gameSeven.rawValue] = isOTurn ? TypeOfTurn.O.rawValue : TypeOfTurn.X.rawValue
            isOTurn = !isOTurn
            checkForWin()
            return
        }
    }
    @IBAction func onClickEight(_ sender: Any?) {
        if nil == arrayOfNine[BoxName.gameEight.rawValue], (sender == nil || getCurrentType() == lblYourType.stringValue) {
            buttonEight.image = isOTurn ? NSImage(systemSymbolName: "circle", accessibilityDescription: "") : NSImage(systemSymbolName: "x.circle.fill", accessibilityDescription: "")
            if (gameType == .online) {
                let createRoomRef = ref.child(DatabaseKey.room.rawValue).child(roomCode)
                createRoomRef.updateChildValues([BoxName.gameEight.rawValue: lblYourType.stringValue])
            }
            arrayOfNine[BoxName.gameEight.rawValue] = isOTurn ? TypeOfTurn.O.rawValue : TypeOfTurn.X.rawValue
            isOTurn = !isOTurn
            checkForWin()
            return
        }
    }
    @IBAction func onClickNine(_ sender: Any?) {
        if nil == arrayOfNine[BoxName.gameNine.rawValue], (sender == nil || getCurrentType() == lblYourType.stringValue)  {
            buttonNine.image = isOTurn ? NSImage(systemSymbolName: "circle", accessibilityDescription: "") : NSImage(systemSymbolName: "x.circle.fill", accessibilityDescription: "")
            if (gameType == .online) {
                let createRoomRef = ref.child(DatabaseKey.room.rawValue).child(roomCode)
                createRoomRef.updateChildValues([BoxName.gameNine.rawValue: lblYourType.stringValue])
            }
            arrayOfNine[BoxName.gameNine.rawValue] = isOTurn ? TypeOfTurn.O.rawValue : TypeOfTurn.X.rawValue
            isOTurn = !isOTurn
            checkForWin()
            return
        }
    }
    
}

//MARK:- checkForWin
extension ViewController {
    func checkForWin() {
        updateTurnMessage()
        if isThreeSame(firstBox: .gameOne, secondBox: BoxName.gameTwo, thirdBox: .gameThree)  {
            announceWinner(winnerType: arrayOfNine[BoxName.gameOne.rawValue])
        } else if isThreeSame(firstBox: .gameFour, secondBox: .gameFive, thirdBox: .gameSix) {
            announceWinner(winnerType: arrayOfNine[BoxName.gameFour.rawValue])
        } else if isThreeSame(firstBox: .gameSeven, secondBox: .gameEight, thirdBox: .gameNine) {
            announceWinner(winnerType: arrayOfNine[BoxName.gameSeven.rawValue])
        } else if isThreeSame(firstBox: .gameOne, secondBox: .gameFour, thirdBox: .gameSeven) {
            announceWinner(winnerType: arrayOfNine[BoxName.gameOne.rawValue])
        } else if isThreeSame(firstBox: .gameTwo, secondBox: .gameFive, thirdBox: .gameEight) {
            announceWinner(winnerType: arrayOfNine[BoxName.gameTwo.rawValue])
        } else if isThreeSame(firstBox: .gameThree, secondBox: .gameSix, thirdBox: .gameNine) {
            announceWinner(winnerType: arrayOfNine[BoxName.gameThree.rawValue])
        } else if isThreeSame(firstBox: .gameOne, secondBox: .gameFive, thirdBox: .gameNine) {
            announceWinner(winnerType: arrayOfNine[BoxName.gameOne.rawValue])
        } else if isThreeSame(firstBox: .gameThree, secondBox: .gameFive, thirdBox: .gameSeven) {
            announceWinner(winnerType: arrayOfNine[BoxName.gameThree.rawValue])
        } else if (arrayOfNine.count == 9) {
            announceWinner(winnerType: TypeOfTurn.default.rawValue)
        }
    }
}

//MARK:- resetGame
extension ViewController {
    func resetGame() {
        arrayOfNine = [:]
        [buttonOne, buttonTwo, buttonThree, buttonFour, buttonFive, buttonSix, buttonSeven, buttonEight, buttonNine].forEach { button in
            button?.image = NSImage()
        }
        isOTurn = true
        if (youAreAdmin) {
            if (Int.random(in: 0...1) == 0) {
                lblYourType.stringValue = TypeOfTurn.O.rawValue
                lblOpponentType.stringValue = TypeOfTurn.X.rawValue
            } else {
                lblYourType.stringValue = TypeOfTurn.X.rawValue
                lblOpponentType.stringValue = TypeOfTurn.O.rawValue
            }
        }
        updateTurnMessage()
    }
}

//MARK:- showAlert
extension ViewController {
    
    func showAlert(message: String, subMessage: String) {
        let alert = NSAlert()
        alert.messageText = message
        alert.informativeText = subMessage
        alert.addButton(withTitle: "Play Again")
        alert.alertStyle = .informational
        var frame = alert.window.frame
        frame.size.height = 500
        frame.size.width = 500
        alert.window.setFrame(frame, display: true)
        let stackViewer = NSStackView(frame: NSRect(x: 0, y: 0, width: 200, height: 00))
        alert.accessoryView = stackViewer
        alert.beginSheetModal(for: self.view.window!, completionHandler: { (modalResponse) -> Void in
            if modalResponse == NSApplication.ModalResponse.alertFirstButtonReturn {
                self.resetGame()
                alert.window.endSheet(self.view.window ?? NSWindow())
            }
        })
    }
}

//MARK:- announceWinner
extension ViewController {
    func announceWinner(winnerType: String?) {
        switch winnerType {
        case lblOpponentType.stringValue:
            showAlert(message: "Opps! \(lblOpponentName.stringValue) won", subMessage: "Better luck next time !")
        case lblYourType.stringValue:
            showAlert(message: "You Won!", subMessage: "Congratulations \(lblYourName.stringValue)")
        default:
            showAlert(message: "Draw !", subMessage: "Play again to win !")
        }
        
    }
}

//MARK:- updateTurnMessage
extension ViewController {
    func updateTurnMessage() {
        if ((isOTurn && lblYourType.stringValue == TypeOfTurn.O.rawValue) || (!isOTurn && lblYourType.stringValue == TypeOfTurn.X.rawValue)) {
            lblTurnMessage.stringValue = GameTurnMessage.your.rawValue
        } else {
            lblTurnMessage.stringValue = "\(lblOpponentName.stringValue)\(GameTurnMessage.opponent.rawValue)"
        }
    }
    
    func getCurrentType() -> String {
        if ((isOTurn && lblYourType.stringValue == TypeOfTurn.O.rawValue) || (!isOTurn && lblYourType.stringValue == TypeOfTurn.X.rawValue)) {
            return lblYourType.stringValue
        } else {
            return lblOpponentType.stringValue
        }
    }
    
}

//MARK:-
extension ViewController {
    
    func isThreeSame(firstBox: BoxName, secondBox: BoxName, thirdBox: BoxName) -> Bool {
        if let first = arrayOfNine[firstBox.rawValue], let second = arrayOfNine[secondBox.rawValue], let third = arrayOfNine[thirdBox.rawValue], (first,second) == (second, third) {
            return true
        } else {
            return false
        }
    }
}

extension ViewController {
    func initiateOnlineGame() {
        let waitingRoomRef = ref.child(DatabaseKey.room.rawValue).child(roomCode)
        waitingRoomRef.observe(.childAdded, with: { (snapshot) -> Void in
            if (snapshot.key.contains("game") && ((snapshot.value as? String ?? "") != self.lblYourType.stringValue)) {
                switch snapshot.key {
                case BoxName.gameOne.rawValue:
                    self.onClickOne(nil)
                case BoxName.gameTwo.rawValue:
                    self.onClickTwo(nil)
                case BoxName.gameThree.rawValue:
                    self.onClickThree(nil)
                case BoxName.gameFour.rawValue:
                    self.onClickFour(nil)
                case BoxName.gameFive.rawValue:
                    self.onClickFive(nil)
                case BoxName.gameSix.rawValue:
                    self.onClickSix(nil)
                case BoxName.gameSeven.rawValue:
                    self.onClickSix(nil)
                case BoxName.gameEight.rawValue:
                    self.onClickSeven(nil)
                case BoxName.gameNine.rawValue:
                    self.onClickNine(nil)
                default:
                    break;
                }
            }
        })
    }
}
