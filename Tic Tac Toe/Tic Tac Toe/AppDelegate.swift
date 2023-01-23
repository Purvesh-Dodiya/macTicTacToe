//
//  AppDelegate.swift
//  Tic Tac Toe
//
//  Created by Purvesh Dodiya on 27/03/22.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        for font in NSFontManager.shared.availableFonts {
            print("Font fam: \(font)")
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

