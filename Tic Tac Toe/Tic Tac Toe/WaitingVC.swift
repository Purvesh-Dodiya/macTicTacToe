//
//  WaitingVC.swift
//  Tic Tac Toe
//
//  Created by Purvesh Dodiya on 09/04/22.
//

import Cocoa
import Firebase
import Lottie

class WaitingVC: NSViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var viewAnimation: NSView!
    @IBOutlet weak var lblRoomCode: NSTextField!
    
    //MARK:- Variables
    var roomCode: String?
    var yourName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let roomCode = roomCode else {return}
        self.lblRoomCode.stringValue = roomCode
        self.checkForOpponentToJoin(roomCode: roomCode)
        let lottieAnimation = AnimationView(name: Animation.waitingAnimation.rawValue)
        lottieAnimation.frame = view.bounds
        lottieAnimation.contentMode = .scaleAspectFill
        lottieAnimation.frame = CGRect(x: 0, y: 0, width: 190, height: 190)
        viewAnimation.addSubview(lottieAnimation)
        lottieAnimation.loopMode = .loop
        lottieAnimation.play()
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
