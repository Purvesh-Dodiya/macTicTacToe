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
    @IBOutlet weak var buttonOne: NSButton!
    @IBOutlet weak var buttonTwo: NSButton!
    @IBOutlet weak var buttonThree: NSButton!
    @IBOutlet weak var buttonFour: NSButton!
    @IBOutlet weak var buttonFive: NSButton!
    @IBOutlet weak var buttonSix: NSButton!
    @IBOutlet weak var buttonSeven: NSButton!
    @IBOutlet weak var buttonEight: NSButton!
    @IBOutlet weak var buttonNine: NSButton!
    
    //MARK:- Variables
    var isOTurn = true
    var arrayOfNine:[String: String] = [:]
    var youAreAdmin = false
    var roomCode: String = ""
    var gameType: GameType?
    
    //MARK:- Variables Create Room
    var ref: DatabaseReference!
    
    
    //MARK:- Main Screen Outlets
    @IBOutlet weak var viewHomeScreen: NSView!
    @IBOutlet weak var viewCreateRoom: NSView!
    @IBOutlet weak var viewGameZone: NSView!
    @IBOutlet weak var viewJoinRoom: NSView!
    
    
    //MARK:- Create Room Outlet
    @IBOutlet weak var btnBackCreateRoom: NSButton!
    @IBOutlet weak var btnCreateRoom: NSButton!
    @IBOutlet weak var indicatorCreateRoom: NSProgressIndicator!
    @IBOutlet weak var txtName: NSTextField!
    
    //MARK:- WaitingRoom Outlets
    @IBOutlet weak var viewWaitingRoomStack: NSView!
    @IBOutlet weak var indicatorWatingRoom: NSProgressIndicator!
    @IBOutlet weak var lblRoomCode: NSTextField!

    //GameZone Outlets
    @IBOutlet weak var lblYourName: NSTextField!
    @IBOutlet weak var lblYourType: NSTextField!
    @IBOutlet weak var lblOpponentName: NSTextField!
    @IBOutlet weak var lblOpponentType: NSTextField!
    @IBOutlet weak var lblTurnMessage: NSTextField!
    @IBOutlet weak var gridView: NSGridView!

    override func viewDidLoad() {
        FirebaseApp.configure()
        ref = Database.database().reference()
        openHomeScreen()
    }
    
    //MARK:- Join Room
    @IBOutlet weak var indicatorJoin: NSProgressIndicator!
    @IBOutlet weak var txtYourNameJoin: NSTextField!
    @IBOutlet weak var txtRoomCodeJoinRoom: NSTextField!
    @IBOutlet weak var btnCreateJoin: NSLayoutConstraint!
    @IBOutlet weak var btnJoinRoom: NSButton!
    @IBOutlet weak var btnBackJoin: NSButton!
  
}

//MARK:- App Outlet Acton
extension ViewController {
    @IBAction func onClickOfOfline(_ sender: Any) {
        openOfLineGameZone()
    }
    
    @IBAction func onClickOfCreateRoomMode(_ sender: NSButton) {
        openCreateRoomScreen()
    }
    
    @IBAction func onClickOfJoinRoom(_ sender: Any) {
        openJoiningRoom()
    }
    
}

