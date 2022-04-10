//
//  StartOflineGame.swift
//  Tic Tac Toe
//
//  Created by Purvesh Dodiya on 09/04/22.
//

import Cocoa

protocol StartOflineGameProtocol {
    func onStartGame(yourName: String, opponentName: String)
}

class StartOflineGame: NSViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var indicatorJoin: NSProgressIndicator!
    @IBOutlet weak var txtYourNameJoin: NSTextField!
    @IBOutlet weak var txtOpponentName: NSTextField!
    @IBOutlet weak var btnJoinRoom: NSButton!
    @IBOutlet weak var btnBackJoin: NSButton!
    
    //MARK:- Variables
    var delegate: StartOflineGameProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorJoin.isHidden = true
    }
    
}

//MARK:- Action Outlets
extension StartOflineGame {
    @IBAction func onClickOfStart(_ sender: NSButton) {
        if (txtYourNameJoin.stringValue.isEmpty) {
            showErrorAlert(message: "Please enter first player name")
        } else if (txtOpponentName.stringValue.isEmpty) {
            showErrorAlert(message: "Please enter second player code")
        } else {
            delegate?.onStartGame(yourName: txtYourNameJoin.stringValue, opponentName: txtOpponentName.stringValue)
            self.dismiss(self)
        }
    }
    
    @IBAction func onClickOfBack(_ sender: NSButton) {
        self.dismiss(self)
    }
}
