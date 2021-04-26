//
//  UIApplication+TopViewController.swift
//  
//
//  Created by Mauricio Chirino on 26/4/21.
//

import UIKit

public extension UIApplication {
    /// Fetches for the top view controller from a given root controller in any stack
    /// - Parameter rootController: controller from where recursive search will begin. It may even container controllers
    ///  such as `UINavigationController` or `UITabBarController`
    /// - Returns: `UIViewController` on top of the stack, should it exist.
    class func topViewController(from rootController: UIViewController?) -> UIViewController? {
        if let navigationController = rootController as? UINavigationController {
            return topViewController(from: navigationController.visibleViewController)
        }

        if let tabController = rootController as? UITabBarController,
           let selected = tabController.selectedViewController {
            return topViewController(from: selected)
        }

        if let presented = rootController?.presentedViewController {
            return topViewController(from: presented)
        }

        return rootController
    }
}
