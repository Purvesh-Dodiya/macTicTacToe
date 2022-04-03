//
//  CommonFunction.swift
//  Tic Tac Toe
//
//  Created by Purvesh Dodiya on 03/04/22.
//

import Cocoa

extension NSViewController {
    func showErrorAlert(message: String) {
        let alert = NSAlert()
        alert.messageText = "Error"
        alert.addButton(withTitle: "Close")
        alert.alertStyle = .critical
        alert.informativeText = message
        var frame = alert.window.frame
        frame.size.height = 500
        frame.size.width = 500
        alert.window.setFrame(frame, display: true)
        let stackViewer = NSStackView(frame: NSRect(x: 0, y: 0, width: 200, height: 00))
        alert.accessoryView = stackViewer
        alert.beginSheetModal(for: self.view.window!, completionHandler: { (modalResponse) -> Void in
            if modalResponse == NSApplication.ModalResponse.alertFirstButtonReturn {
                alert.window.endSheet(self.view.window ?? NSWindow())
            }
        })
    }
    
}

//MARK: Open Screen
extension ViewController {
    
    func openHomeScreen() {
        viewGameZone.isHidden = true
        viewHomeScreen.isHidden = false
        viewCreateRoom.isHidden = true
        viewWaitingRoomStack.isHidden = true
    }
    
    func openOfLineGameZone() {
        viewGameZone.isHidden = false
        viewHomeScreen.isHidden = true
        viewCreateRoom.isHidden = true
        viewWaitingRoomStack.isHidden = true
    }
    
    func openCreateRoomScreen() {
        viewGameZone.isHidden = true
        viewHomeScreen.isHidden = true
        viewCreateRoom.isHidden = false
        viewWaitingRoomStack.isHidden = true
        indicatorCreateRoom.isHidden = true
        btnCreateRoom.isHidden = false
    }
    
    func openWaitingRoomScreen() {
        viewGameZone.isHidden = true
        viewHomeScreen.isHidden = true
        viewCreateRoom.isHidden = true
        viewWaitingRoomStack.isHidden = false
        indicatorWatingRoom.startAnimation(nil)
    }
    
    func openGameZoneWithOpponentName(opponentName: String, yourName: String) {
        viewGameZone.isHidden = false
        viewHomeScreen.isHidden = true
        viewCreateRoom.isHidden = true
        viewWaitingRoomStack.isHidden = true
        lblOpponentName.stringValue = opponentName
        lblYourName.stringValue = yourName
        gameType = .online
        resetGame()
        initiateOnlineGame()
    }
}
