//
//  UIViewController+Utilities.swift
//  Marvel Characters
//
//  Created by Andres Acevedo on 19/02/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentErrorMessage(messageText: String) {
        let alertTitle = NSLocalizedString("general.error", comment: "general error")
        let alertController = UIAlertController(title: alertTitle, message: messageText, preferredStyle: .alert)
        let buttonTitle = NSLocalizedString("general.ok", comment: "general ok")
        let buttonAction = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alertController.addAction(buttonAction)
        DispatchQueue.main.async { // In case this is called on background threads. 
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
