//
//  UITableView.swift
//  MauriKit
//
//  Created by Mauricio Chirino on 24/03/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import UIKit

public extension UITableView {
    /// Registers a `UITableViewCell` in the current `UITableView` with its _class name_ as a default identifier
    /// - Parameter cellType: type for the desired `UITableViewCell` to register
    func register<T: UITableViewCell>(cellType: T.Type) {
        self.register(cellType.self, forCellReuseIdentifier: String(describing: cellType.self))
    }

    /// Registers a `UITableViewCell` with its companion xib file in the current `UITableView` with its _class name_ as a default identifier
    /// File names for both `UICollectionViewCell` and xib **MUST** match with custom _class name_
    /// - Parameters:
    ///   - : type for the desired `UITableViewCell` to register
    ///   - bundle: `Bundle` where the xib file is contained. Defaults to the same bundle where `UITableViewCell` file is located in
    func registerNib<T: UITableViewCell>(for cellType: T.Type, from bundle: Bundle = Bundle(for: T.self)) {
        let xibIdentifier = String(describing: cellType.self).components(separatedBy: ".").last ?? ""
        let nib = UINib(nibName: xibIdentifier, bundle: bundle)

        register(nib, forCellReuseIdentifier: xibIdentifier)
    }

    /// Dequeues a custom registered `UITableViewCell` from the current `UITableView`
    /// - Parameters:
    ///   - id: identifier for the desired `UITableViewCell`. Defaults to its _class name_
    ///   - indexPath: requested `IndexPath` to dequeue from
    /// - Returns: A casted `UITableViewCell` into the custom type inferred by `T`
    func dequeue<T: UITableViewCell>(for id: String = String(describing: T.self)) -> T {
        guard let dequeued = self.dequeueReusableCell(withIdentifier: id) as? T else {
            preconditionFailure("Check your UITableViewCell settings for \(T.self)")
        }

        return dequeued
    }
}
