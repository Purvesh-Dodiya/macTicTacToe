//
//  SecondVC.swift
//  Tic Tac Toe
//
//  Created by Purvesh Dodiya on 09/04/22.
//

import Cocoa
import Firebase

class CreateRoomoVC: NSViewController {
    
    //MARK:- Create Room Outlet
    @IBOutlet weak var btnBackCreateRoom: NSButton!
    @IBOutlet weak var btnCreateRoom: NSButton!
    @IBOutlet weak var indicatorCreateRoom: NSProgressIndicator!
    @IBOutlet weak var txtName: NSTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }

}


//Create Room Action
extension CreateRoomoVC {
    @IBAction func onClickOfCreateRoomBack(_ sender: Any) {
       dismiss(self)
    }
    
    @IBAction func onClickOfCreateRoomApi(_ sender: NSButton) {
        if (!txtName.stringValue.isEmpty) {
            btnCreateRoom.isHidden = true
            indicatorCreateRoom.isHidden = false
            btnBackCreateRoom.isHidden = true
            indicatorCreateRoom.startAnimation(nil)
            let ref = Database.database().reference()
            let createRoomRef = ref.child(DatabaseKey.room.rawValue).childByAutoId()
            createRoomRef.setValue([DatabaseKey.yourName.rawValue: txtName.stringValue]) { [weak self] (error, reference) -> Void in
                guard let `self` = self else {return}
                if (error != nil) {
                    self.showErrorAlert(message: error?.localizedDescription ?? "")
                    self.btnCreateRoom.isHidden = false
                    self.indicatorCreateRoom.isHidden = true
                    self.btnBackCreateRoom.isHidden = false
                } else {
                    self.dismiss(self)
//                    self.lblRoomCode.stringValue = createRoomRef.key ?? "Please create room again"
//                    self.openWaitingRoomScreen()
//                    self.checkForOpponentToJoin(roomCode: createRoomRef.key ?? "")
                }
            }
        } else {
            showErrorAlert(message: "Please enter your name")
        }
    }
}
