//
//  SecondVC.swift
//  Tic Tac Toe
//
//  Created by Purvesh Dodiya on 09/04/22.
//

import Cocoa
import Firebase

protocol RoomCreated {
    func roomCreated(roomCode: String, yourName: String)
}

class CreateRoomVC: NSViewController {
    
    //MARK:- Create Room Outlet
    @IBOutlet weak var btnBackCreateRoom: NSButton!
    @IBOutlet weak var btnCreateRoom: NSButton!
    @IBOutlet weak var indicatorCreateRoom: NSProgressIndicator!
    @IBOutlet weak var txtName: NSTextField!
    
    //MARK:- Variables
    var delegate: RoomCreated?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorCreateRoom.isHidden = true
    }
    
}


//MARK:-  Action Outlets
extension CreateRoomVC {
    @IBAction func onClickOfCreateRoomBack(_ sender: Any) {
        dismiss(self)
    }
    
    @IBAction func onClickOfCreateRoomApi(_ sender: NSButton) {
        if (!txtName.stringValue.isEmpty) {
            btnCreateRoom.isHidden = true
            indicatorCreateRoom.isHidden = false
            btnBackCreateRoom.isHidden = true
            indicatorCreateRoom.startAnimation(nil)
            let createRoomRef = Database.database().reference().child(DatabaseKey.room.rawValue).childByAutoId()
            createRoomRef.setValue([DatabaseKey.yourName.rawValue: txtName.stringValue]) { [weak self] (error, reference) -> Void in
                guard let `self` = self else {return}
                if (error != nil) {
                    self.showErrorAlert(message: error?.localizedDescription ?? "")
                    self.btnCreateRoom.isHidden = false
                    self.indicatorCreateRoom.isHidden = true
                    self.btnBackCreateRoom.isHidden = false
                } else {
                    self.delegate?.roomCreated(roomCode: createRoomRef.key ?? "", yourName: self.txtName.stringValue)
                    self.dismiss(self)
                }
            }
        } else {
            showErrorAlert(message: "Please enter your name")
        }
    }
}
