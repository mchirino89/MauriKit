//
//  NavBarCustomization.swift
//  
//
//  Created by Mauricio Chirino on 25/4/21.
//

import UIKit

public extension UIViewController {
    /// Forces the titles within the navigation stack to be large. Ideally should be called from the root controller in the `UINavigationController`
    /// - Parameter title: Title text for the view controller invoking this method
    func setLarge(title: String) {
        self.title = title
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    /// Set the title of the current view controller in regular size
    func disableLargeTitleOnCurrentViewController() {
        navigationItem.largeTitleDisplayMode = .never
    }

    /// Removes previous `ViewController` title (or the word _Back_ in case it didn't have one) next to the back button on the navigation bar
    func hideBackButtonText() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
