//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Purvesh Dodiya on 27/03/22.
//

import Cocoa

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
    
    //MARK:- Vairiables
    var isOTurn = true
    var arrayOfNine = [TypeOfTurn](repeating: .default, count: 9)
    
    //Enum
    enum TypeOfTurn {
        case x
        case o
        case `default`
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

//MARK:- OutLet Actions
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
        
    }
}
