//
//  Navigation+Border.swift
//  
//
//  Created by Mauricio Chirino on 24/4/21.
//

import UIKit

public extension UINavigationBar {
    func hideBorder() {
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        self.isTranslucent = true
    }
}

public extension UINavigationController {
    func setTranslucent() {
        self.navigationBar.hideBorder()
        self.view.backgroundColor = .clear
    }
}
