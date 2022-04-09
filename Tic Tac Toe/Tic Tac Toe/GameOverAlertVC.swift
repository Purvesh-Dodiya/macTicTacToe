//
//  GameOverAlert.swift
//  Tic Tac Toe
//
//  Created by Purvesh Dodiya on 10/04/22.
//

import Cocoa
import Lottie

protocol GameOverDelegate {
   func onGameOverPressed()
}

class GameOverAlertVC: NSViewController {

    //MARK:- Outlets
    @IBOutlet weak var lblTitle: NSTextField!
    @IBOutlet weak var lblDescription: NSTextField!
    @IBOutlet weak var btnOkay: NSButton!
    @IBOutlet weak var viewAnimation: NSView!
    
    //MARK:- Variables
    var delegate: GameOverDelegate?
    var titleText: String?
    var descriptionText: String?
    var buttonText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.stringValue = titleText ?? ""
        lblDescription.stringValue = descriptionText ?? ""
        btnOkay.title = buttonText ?? ""
        let lottieAnimation = AnimationView(name: Animation.gameOverAnimation.rawValue)
        lottieAnimation.frame = view.bounds
        lottieAnimation.contentMode = .scaleAspectFill
        lottieAnimation.frame = CGRect(x: 0, y: 0, width: 220, height: 220)
        viewAnimation.addSubview(lottieAnimation)
        lottieAnimation.loopMode = .loop
        lottieAnimation.play()
    }

}

extension GameOverAlertVC {
    
    @IBAction func onClickOfButton(_ sender: Any) {
        delegate?.onGameOverPressed()
        self.dismiss(self)
    }
    
}
