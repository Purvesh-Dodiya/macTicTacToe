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
    @IBOutlet weak var gridView: NSGridView!
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
    var arrayOfNine = [TypeOfTurn](repeating: .default, count: 9)
    
    //MARK:- Variables Create Room
    var ref: DatabaseReference!
    
    
    //MARK:- Main Screen Outlets
    @IBOutlet weak var viewHomeScreen: NSView!
    @IBOutlet weak var viewCreateRoom: NSView!
    
    
    //MARK:- Create Room Outlet
    @IBOutlet weak var btnBackCreateRoom: NSButton!
    @IBOutlet weak var btnCreateRoom: NSButton!
    @IBOutlet weak var indicatorCreateRoom: NSProgressIndicator!
    @IBOutlet weak var txtName: NSTextField!
    
    //MARK:- WaitingRoom Outlets
    @IBOutlet weak var viewWaitingRoomStack: NSView!
    @IBOutlet weak var indicatorWatingRoom: NSProgressIndicator!
    @IBOutlet weak var lblRoomCode: NSTextField!
    
    
    override func viewDidLoad() {
        FirebaseApp.configure()
        ref = Database.database().reference()
        openHomeScreen()
    }
    
    
}

//MARK:- App Outlet Acton
extension ViewController {
    @IBAction func onClickOfOfline(_ sender: Any) {
        gridView.isHidden = false
        viewHomeScreen.isHidden = true
        viewCreateRoom.isHidden = true
    }
    
    @IBAction func onClickOfCreateRoomMode(_ sender: NSButton) {
        openCreateRoomScreen()
    }
    
    
}

//MARK:- GameZone OutLet Actions
extension ViewController {
    
    @IBAction func onClickOne(_ sender: Any) {
        if (arrayOfNine[0] == .default) {
            buttonOne.image = isOTurn ? NSImage(systemSymbolName: "circle", accessibilityDescription: "") : NSImage(systemSymbolName: "x.circle.fill", accessibilityDescription: "")
            arrayOfNine[0] = isOTurn ? TypeOfTurn.o : TypeOfTurn.x
            isOTurn = !isOTurn
            checkForWin()
        }
    }
    @IBAction func onClickTwo(_ sender: Any) {
        if (arrayOfNine[1] == .default) {
            buttonTwo.image = isOTurn ? NSImage(systemSymbolName: "circle", accessibilityDescription: "") : NSImage(systemSymbolName: "x.circle.fill", accessibilityDescription: "")
            arrayOfNine[1] = isOTurn ? TypeOfTurn.o : TypeOfTurn.x
            isOTurn = !isOTurn
            checkForWin()
        }
    }
    @IBAction func onClickThree(_ sender: Any) {
        if (arrayOfNine[2] == .default) {
            buttonThree.image = isOTurn ? NSImage(systemSymbolName: "circle", accessibilityDescription: "") : NSImage(systemSymbolName: "x.circle.fill", accessibilityDescription: "")
            arrayOfNine[2] = isOTurn ? TypeOfTurn.o : TypeOfTurn.x
            isOTurn = !isOTurn
            checkForWin()
        }
    }
    @IBAction func onClickFour(_ sender: Any) {
        if (arrayOfNine[3] == .default) {
            buttonFour.image = isOTurn ? NSImage(systemSymbolName: "circle", accessibilityDescription: "") : NSImage(systemSymbolName: "x.circle.fill", accessibilityDescription: "")
            arrayOfNine[3] = isOTurn ? TypeOfTurn.o : TypeOfTurn.x
            isOTurn = !isOTurn
            checkForWin()
        }
    }
    @IBAction func onClickFive(_ sender: Any) {
        if (arrayOfNine[4] == .default) {
            buttonFive.image = isOTurn ? NSImage(systemSymbolName: "circle", accessibilityDescription: "") : NSImage(systemSymbolName: "x.circle.fill", accessibilityDescription: "")
            arrayOfNine[4] = isOTurn ? TypeOfTurn.o : TypeOfTurn.x
            isOTurn = !isOTurn
            checkForWin()
        }
    }
    @IBAction func onClickSix(_ sender: Any) {
        if (arrayOfNine[5] == .default) {
            buttonSix.image = isOTurn ? NSImage(systemSymbolName: "circle", accessibilityDescription: "") : NSImage(systemSymbolName: "x.circle.fill", accessibilityDescription: "")
            arrayOfNine[5] = isOTurn ? TypeOfTurn.o : TypeOfTurn.x
            isOTurn = !isOTurn
            checkForWin()
        }
    }
    @IBAction func onClickSeven(_ sender: Any) {
        if (arrayOfNine[6] == .default) {
            buttonSeven.image = isOTurn ? NSImage(systemSymbolName: "circle", accessibilityDescription: "") : NSImage(systemSymbolName: "x.circle.fill", accessibilityDescription: "")
            arrayOfNine[6] = isOTurn ? TypeOfTurn.o : TypeOfTurn.x
            isOTurn = !isOTurn
            checkForWin()
        }
    }
    @IBAction func onClickEight(_ sender: Any) {
        if (arrayOfNine[7] == .default) {
            buttonEight.image = isOTurn ? NSImage(systemSymbolName: "circle", accessibilityDescription: "") : NSImage(systemSymbolName: "x.circle.fill", accessibilityDescription: "")
            arrayOfNine[7] = isOTurn ? TypeOfTurn.o : TypeOfTurn.x
            isOTurn = !isOTurn
            checkForWin()
        }
    }
    @IBAction func onClickNine(_ sender: Any) {
        if (arrayOfNine[8] == .default) {
            buttonNine.image = isOTurn ? NSImage(systemSymbolName: "circle", accessibilityDescription: "") : NSImage(systemSymbolName: "x.circle.fill", accessibilityDescription: "")
            arrayOfNine[8] = isOTurn ? TypeOfTurn.o : TypeOfTurn.x
            isOTurn = !isOTurn
            checkForWin()
        }
    }
    
}

extension ViewController {
    func checkForWin() {
        if (arrayOfNine[0] == arrayOfNine [1] && arrayOfNine [1] == arrayOfNine[2] && arrayOfNine[2] != TypeOfTurn.default) {
            announceWinner(winnerType: arrayOfNine[2])
        } else if (arrayOfNine[3] == arrayOfNine [4] && arrayOfNine [4] == arrayOfNine[5] && arrayOfNine[5] != TypeOfTurn.default) {
            announceWinner(winnerType: arrayOfNine[5])
        } else if (arrayOfNine[6] == arrayOfNine [7] && arrayOfNine [7] == arrayOfNine[8] && arrayOfNine[8] != TypeOfTurn.default) {
            announceWinner(winnerType: arrayOfNine[8])
        } else if (arrayOfNine[0] == arrayOfNine [3] && arrayOfNine [3] == arrayOfNine[6] && arrayOfNine[6] != TypeOfTurn.default) {
            announceWinner(winnerType: arrayOfNine[6])
        } else if (arrayOfNine[1] == arrayOfNine [4] && arrayOfNine [4] == arrayOfNine[7] && arrayOfNine[7] != TypeOfTurn.default) {
            announceWinner(winnerType: arrayOfNine[7])
        } else if (arrayOfNine[2] == arrayOfNine [5] && arrayOfNine [5] == arrayOfNine[8] && arrayOfNine[8] != TypeOfTurn.default) {
            announceWinner(winnerType: arrayOfNine[8])
        } else if (arrayOfNine[0] == arrayOfNine [4] && arrayOfNine [4] == arrayOfNine[8] && arrayOfNine[8] != TypeOfTurn.default) {
            announceWinner(winnerType: arrayOfNine[8])
        } else if (arrayOfNine[2] == arrayOfNine [4] && arrayOfNine [4] == arrayOfNine[6] && arrayOfNine[6] != TypeOfTurn.default) {
            announceWinner(winnerType: arrayOfNine[6])
        } else if (!arrayOfNine.contains(TypeOfTurn.default)) {
            announceWinner(winnerType: TypeOfTurn.default)
        }
    }
}

extension ViewController {
    func announceWinner(winnerType: TypeOfTurn) {
        switch winnerType {
        case .default:
            showAlert(message: "Draw !")
        case .x, .o:
            showAlert(message: "Congratulations \(winnerType.rawValue)")
        }
        
    }
}


extension ViewController {
    
    func showAlert(message: String) {
        let alert = NSAlert()
        alert.messageText = message
        alert.addButton(withTitle: "Play Again")
        alert.informativeText = "Infffoo"
        alert.alertStyle = .informational
        var frame = alert.window.frame
        frame.size.height = 500
        frame.size.width = 500
        alert.window.setFrame(frame, display: true)
        let stackViewer = NSStackView(frame: NSRect(x: 0, y: 0, width: 200, height: 00))
        alert.accessoryView = stackViewer
        alert.beginSheetModal(for: self.view.window!, completionHandler: { (modalResponse) -> Void in
            if modalResponse == NSApplication.ModalResponse.alertFirstButtonReturn {
                self.resetGame()
                alert.window.endSheet(self.view.window ?? NSWindow())
            }
        })
    }
}

extension ViewController {
    func resetGame() {
        arrayOfNine = [TypeOfTurn](repeating: .default, count: 9)
        [buttonOne, buttonTwo, buttonThree, buttonFour, buttonFive, buttonSix, buttonSeven, buttonEight, buttonNine].forEach { button in
            button?.image = NSImage()
        }
    }
}
