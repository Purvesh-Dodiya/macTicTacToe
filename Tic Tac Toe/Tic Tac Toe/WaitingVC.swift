//
//  WaitingVC.swift
//  Tic Tac Toe
//
//  Created by Purvesh Dodiya on 09/04/22.
//

import Cocoa
import Firebase

class WaitingVC: NSViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var indicatorWatingRoom: NSProgressIndicator!
    @IBOutlet weak var lblRoomCode: NSTextField!
    
    //MARK:- Variables
    var roomCode: String?
    var yourName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorWatingRoom.startAnimation(nil)
        guard let roomCode = roomCode else {return}
        self.lblRoomCode.stringValue = roomCode
        self.checkForOpponentToJoin(roomCode: roomCode)
    }
    
}

//MARK:- Action Outlets
extension WaitingVC {
    @IBAction func onClickOfCopyRoomCode(_ sender: NSButton) {
        let pasteBoard = NSPasteboard.general
        pasteBoard.clearContents()
        pasteBoard.writeObjects([lblRoomCode.stringValue as NSString])
    }
}

//MARK:- checkForOpponentToJoin
extension WaitingVC {
    
    func checkForOpponentToJoin(roomCode: String) {
        let waitingRoomRef = Database.database().reference().child(DatabaseKey.room.rawValue).child(roomCode)
        waitingRoomRef.observe(.childAdded, with: { (snapshot) -> Void in
            if (snapshot.key == DatabaseKey.opponentName.rawValue) {
                self.moveToOnlineGameZone(youAreAdmin: true, roomCode: roomCode, yourName: self.yourName ?? "", opponentName: snapshot.value as? String ?? "")
            }
        })
    }
    
    @IBAction func onClickOfExitGame(_ sender: NSButton) {
        moveToHomeVC()
    }
}
