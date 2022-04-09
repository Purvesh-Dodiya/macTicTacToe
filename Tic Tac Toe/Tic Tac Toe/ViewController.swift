//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Purvesh Dodiya on 27/03/22.
//

import Cocoa
import Firebase

class ViewController: NSViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var viewHomeScreen: NSView!
    
    override func viewDidLoad() {
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
    }
}

//MARK:- App Outlet Acton
extension ViewController {
    @IBAction func onClickOfOfline(_ sender: Any) {
        if let startOflineGame = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "startOflineGame") as? StartOflineGame {
            startOflineGame.delegate = self
            self.presentAsSheet(startOflineGame)
        }
    }
    
    @IBAction func onClickOfCreateRoomMode(_ sender: NSButton) {
        if let createRoomVC = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "createRoomVC") as? CreateRoomVC {
            createRoomVC.delegate = self
            self.presentAsSheet(createRoomVC)
        }
    }
    
    @IBAction func onClickOfJoinRoom(_ sender: Any) {
        if let joinRoomVC = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "joinRoomVC") as? JoinRoomVC {
            joinRoomVC.delegate = self
            self.presentAsSheet(joinRoomVC)
        }
    }
    
}

//MARK:- RoomCreated
extension ViewController: RoomCreated {
    func roomCreated(roomCode: String, yourName: String) {
        if let waitingVC = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "waitingVC") as? WaitingVC {
            waitingVC.roomCode = roomCode
            waitingVC.yourName = yourName
            presentInNewWindow(viewController: waitingVC)
        }
    }
    
}

//MARK:- JointRoomProtocol
extension ViewController: JointRoomProtocol {
    func onJoinedSuccess(youName: String, opponentName: String, roomCode: String) {
        moveToOnlineGameZone(youAreAdmin: false, roomCode: roomCode, yourName: youName, opponentName: opponentName)
    }
    
}

extension ViewController: StartOflineGameProtocol {
    func onStartGame(yourName: String, opponentName: String) {
        moveToOflineGameZone(yourName: yourName, opponentName: opponentName)
    }
    
}
