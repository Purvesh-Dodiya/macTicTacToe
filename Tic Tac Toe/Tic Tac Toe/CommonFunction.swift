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
    
    func presentInNewWindow(viewController: NSViewController) {
        self.view.window?.contentViewController = viewController
    }
    
    func moveToHomeVC() {
        if let viewController = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "viewController") as? ViewController {
            presentInNewWindow(viewController: viewController)
        }
    }
    
    func moveToOnlineGameZone(youAreAdmin: Bool, roomCode: String, yourName: String, opponentName: String) {
        if let gameZoneVC = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "gameZoneVC") as? GameZoneVC {
            gameZoneVC.youAreAdmin = youAreAdmin
            gameZoneVC.roomCode = roomCode
            gameZoneVC.yourName = yourName
            gameZoneVC.opponentName = opponentName
            gameZoneVC.gameType = .online
            self.presentInNewWindow(viewController: gameZoneVC)
        }
    }
    
    func moveToOflineGameZone(yourName: String, opponentName: String) {
        if let gameZoneVC = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "gameZoneVC") as? GameZoneVC {
            gameZoneVC.youAreAdmin = false
            gameZoneVC.yourName = yourName
            gameZoneVC.opponentName = opponentName
            gameZoneVC.gameType = .ofline
            self.presentInNewWindow(viewController: gameZoneVC)
        }
    }
}
