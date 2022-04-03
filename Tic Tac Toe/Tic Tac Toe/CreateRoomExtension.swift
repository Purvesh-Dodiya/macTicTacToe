//
//  CreateRoomExtension.swift
//  Tic Tac Toe
//
//  Created by Purvesh Dodiya on 03/04/22.
//

import Cocoa
import Firebase

//Create Room Action
extension ViewController {
    @IBAction func onClickOfCreateRoomBack(_ sender: Any) {
        gridView.isHidden = true
        viewHomeScreen.isHidden = false
        viewCreateRoom.isHidden = true
    }
    
    @IBAction func onClickOfCreateRoomApi(_ sender: NSButton) {
        btnCreateRoom.isHidden = true
        indicatorCreateRoom.isHidden = false
        btnBackCreateRoom.isHidden = true
        indicatorCreateRoom.startAnimation(nil)
        let createRoomRef = ref.child(DatabaseKey.room.rawValue).childByAutoId()
        createRoomRef.setValue([DatabaseKey.yourName.rawValue: txtName.stringValue]) { [weak self] (error, reference) -> Void in
            guard let `self` = self else {return}
            if (error != nil) {
                self.showErrorAlert(message: error?.localizedDescription ?? "")
                self.btnCreateRoom.isHidden = false
                self.indicatorCreateRoom.isHidden = true
                self.btnBackCreateRoom.isHidden = false
            } else {
                self.lblRoomCode.stringValue = createRoomRef.key ?? "Please create room again"
                self.openWaitingRoomScreen()
                self.checkForOpponentToJoin(roomCode: createRoomRef.key ?? "")
            }
        }
    }
}
