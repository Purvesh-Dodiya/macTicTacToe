//
//  JoinRoomExtension.swift
//  Tic Tac Toe
//
//  Created by Purvesh Dodiya on 03/04/22.
//

import Cocoa

//MARK:- Join Action Outlets
extension ViewController {
    
    @IBAction func onClickOfJoin(_ sender: NSButton) {
        if (txtYourNameJoin.stringValue.isEmpty) {
            showErrorAlert(message: "Please enter your name")
        } else if (txtRoomCodeJoinRoom.stringValue.isEmpty) {
            showErrorAlert(message: "Please enter room code")
        } else {
            btnBackJoin.isHidden = true
            indicatorJoin.isHidden = false
            btnJoinRoom.isHidden = true
            indicatorCreateRoom.startAnimation(nil)
            let joinRoomRef = ref.child(DatabaseKey.room.rawValue).child(self.txtRoomCodeJoinRoom.stringValue )
            joinRoomRef.observeSingleEvent(of: .value, with: { [weak self] (snapshot) in
                guard let `self` = self else {return}
                if snapshot.exists() {
                    self.roomCode = self.txtRoomCodeJoinRoom.stringValue
                    self.initiateTurnObserver()
                    joinRoomRef.updateChildValues([DatabaseKey.opponentName.rawValue: self.txtYourNameJoin.stringValue]) { [weak self] (error, reference) -> Void in
                        guard let `self` = self else {return}
                        if (error != nil) {
                            self.showErrorAlert(message: error?.localizedDescription ?? "")
                            self.btnBackJoin.isHidden = false
                            self.indicatorJoin.isHidden = true
                            self.btnJoinRoom.isHidden = false
                        } else {
                            self.btnBackJoin.isHidden = false
                            self.indicatorJoin.isHidden = true
                            self.btnJoinRoom.isHidden = false
                            self.youAreAdmin = false
                            self.openGameZoneWithOpponentName(opponentName: snapshot.childSnapshot(forPath: DatabaseKey.yourName.rawValue).value as? String ?? "", yourName: self.txtYourNameJoin.stringValue)
                        }
                    }
                } else {
                    self.showErrorAlert(message: "Room code is invalid!")
                    self.btnBackJoin.isHidden = false
                    self.indicatorJoin.isHidden = true
                    self.btnJoinRoom.isHidden = false
                }
            })
        }
    }
    
    @IBAction func onClickOfBack(_ sender: NSButton) {
        viewGameZone.isHidden = true
        viewHomeScreen.isHidden = false
        viewCreateRoom.isHidden = true
        viewWaitingRoomStack.isHidden = true
        viewJoinRoom.isHidden = true
    }
    
}
