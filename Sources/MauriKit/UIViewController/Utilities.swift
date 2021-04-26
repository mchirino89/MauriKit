//
//  UIViewController.swift
//  MauriKit
//
//  Created by Mauricio Chirino on 1/4/20.
//  Copyright © 2020 Mauricio Chirino. All rights reserved.
//

import UIKit

public extension UIViewController {
    /// Checks whether the current view controller is visible the window
    var isVisible: Bool {
        self.view.window != nil
    }

    /// Removes previous `ViewController` title (or the word _Back_ in case it didn't have one) next to the back button on the navigation bar
    internal func hideBackButtonText() {
        let topController = UIApplication.topViewController(from: self)
        let cleanBackButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        topController?.navigationItem.backBarButtonItem = cleanBackButton
    }
}
