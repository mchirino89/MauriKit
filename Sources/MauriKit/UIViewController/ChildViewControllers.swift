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
    func addExternal(viewController: UIViewController, on container: UIView) {
        addChild(viewController)
        container.addSubview(viewController.view)
        viewController.view.frame = container.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
    }

    func removeFromParent() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
