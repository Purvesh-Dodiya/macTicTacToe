//
//  WaitingRoomExtension.swift
//  Tic Tac Toe
//
//  Created by Purvesh Dodiya on 03/04/22.
//

import Cocoa

//MARK:- Waiting Room Outlets
extension ViewController {
    @IBAction func onClickOfCopyRoomCode(_ sender: NSButton) {
        let pasteBoard = NSPasteboard.general
        pasteBoard.clearContents()
        pasteBoard.writeObjects([lblRoomCode.stringValue as NSString])
    }
}

//MARK:- checkForOpponentToJoin
extension ViewController {
    
    func checkForOpponentToJoin(roomCode: String) {
        let waitingRoomRef = ref.child(DatabaseKey.room.rawValue).child(roomCode)
        waitingRoomRef.observe(.childAdded, with: { (snapshot) -> Void in
            if (snapshot.key == DatabaseKey.opponentName.rawValue) {
                self.youAreAdmin = true
                self.roomCode = roomCode
                self.openGameZoneWithOpponentName(opponentName: (snapshot.value as? String) ?? "", yourName: self.lblYourName.stringValue)
            }
        })
    }
}
