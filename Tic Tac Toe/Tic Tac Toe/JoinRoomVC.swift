//
//  JoinRoomVC.swift
//  Tic Tac Toe
//
//  Created by Purvesh Dodiya on 09/04/22.
//

import Cocoa
import Firebase

protocol JointRoomProtocol {
    func onJoinedSuccess(youName: String, opponentName: String, roomCode: String)
}

class JoinRoomVC: NSViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var indicatorJoin: NSProgressIndicator!
    @IBOutlet weak var txtYourNameJoin: NSTextField!
    @IBOutlet weak var txtRoomCodeJoinRoom: NSTextField!
    @IBOutlet weak var btnJoinRoom: NSButton!
    @IBOutlet weak var btnBackJoin: NSButton!
    
    //MARK:- Variables
    var delegate: JointRoomProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorJoin.isHidden = true
    }
    
}

//MARK:- Action Outlets
extension JoinRoomVC {
    
    @IBAction func onClickOfJoin(_ sender: NSButton) {
        if (txtYourNameJoin.stringValue.isEmpty) {
            showErrorAlert(message: "Please enter your name")
        } else if (txtRoomCodeJoinRoom.stringValue.isEmpty) {
            showErrorAlert(message: "Please enter room code")
        } else {
            btnBackJoin.isHidden = true
            indicatorJoin.isHidden = false
            btnJoinRoom.isHidden = true
            indicatorJoin.startAnimation(nil)
            let joinRoomRef = Database.database().reference().child(DatabaseKey.room.rawValue)
                .child(self.txtRoomCodeJoinRoom.stringValue )
            joinRoomRef.observeSingleEvent(of: .value, with: { [weak self] (snapshot) in
                guard let `self` = self else {return}
                if snapshot.exists() {
                    joinRoomRef.updateChildValues([DatabaseKey.opponentName.rawValue: self.txtYourNameJoin.stringValue]) { [weak self] (error, reference) -> Void in
                        guard let `self` = self else {return}
                        if (error != nil) {
                            self.showErrorAlert(message: error?.localizedDescription ?? "")
                            self.btnBackJoin.isHidden = false
                            self.indicatorJoin.isHidden = true
                            self.btnJoinRoom.isHidden = false
                        } else {
                            self.delegate?.onJoinedSuccess(youName: self.txtYourNameJoin.stringValue, opponentName: snapshot.childSnapshot(forPath: DatabaseKey.yourName.rawValue).value as? String ?? "", roomCode: self.txtRoomCodeJoinRoom.stringValue)
                            self.dismiss(self)
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
        self.dismiss(self)
    }
    
}
