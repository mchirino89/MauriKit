//
//  Navigation+Border.swift
//  
//
//  Created by Mauricio Chirino on 24/4/21.
//

import UIKit

public extension UINavigationBar {
    /// Hides navigation bar's native borders
    func hideBorder() {
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        self.isTranslucent = true
    }
}

public extension UINavigationController {
    /// Sets transparent navigation controller
    func setTranslucent() {
        self.navigationBar.hideBorder()
        self.view.backgroundColor = .clear
    }
}
