//
//  ChildViewControllers.swift
//  
//
//  Created by Mauricio Chirino on 24/4/21.
//

import UIKit

@nonobjc
/// Inspiration [source](https://www.hackingwithswift.com/example-code/uikit/how-to-use-view-controller-containment)
public extension UIViewController {
    /// Adds a child view controller within the bounds of a provided view
    /// - Parameters:
    ///   - viewController: `UIViewController` to be added
    ///   - container: container `UIView` for the Child ViewController to fill entirely
    func addExternal(viewController: UIViewController, on container: UIView) {
        addChild(viewController)
        container.addSubview(viewController.view)
        viewController.view.frame = container.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
    }

    /// Removes the current `UIViewController` from its parent
    func removeChildViewController() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
