//
//  UICollectionView.swift
//  MauriKit
//
//  Created by Mauricio Chirino on 1/4/20.
//  Copyright © 2020 Mauricio Chirino. All rights reserved.
//

import UIKit

public extension UICollectionView {
    /// Registers a `UICollectionViewCell` in the current `UICollectionView` with its _class name_ as a default identifier
    /// - Parameter cellType: type for the desired `UICollectionViewCell` to register
    func register<T: UICollectionViewCell>(cellType: T.Type) {
        register(cellType.self, forCellWithReuseIdentifier: String(describing: cellType.self))
    }

    /// Registers a `UICollectionViewCell` with its companion xib file in the current `UICollectionView` with its _class name_ as a default identifier
    /// - Parameters:
    ///   - : type for the desired `UICollectionViewCell` to register
    ///   - bundle: `Bundle` where the xib file is contained. Defaults to the same bundle where `UICollectionViewCell` file is located in
    func registerNib<T: UICollectionViewCell>(_: T.Type, from bundle: Bundle = Bundle(for: T.self)) {
        let xibIdentifier = String(describing: T.self).components(separatedBy: ".").last ?? ""
        let nib = UINib(nibName: xibIdentifier, bundle: bundle)

        register(nib, forCellWithReuseIdentifier: xibIdentifier)
    }

    /// Dequeues a custom registered `UICollectionViewCell` from the current `UICollectionView`
    /// - Parameters:
    ///   - id: identifier for the desired `UICollectionViewCell`. Defaults to its _class name_
    ///   - indexPath: requested `IndexPath` to dequeue from
    /// - Returns: A casted `UICollectionViewCell` into the custom type inferred by `T`
    func dequeue<T: UICollectionViewCell>(for id: String = String(describing: T.self),
                                          at indexPath: IndexPath) -> T {
        guard let dequeued = self.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as? T else {
            preconditionFailure("Check your UICollectionViewCell settings for \(T.self)")
        }

        return dequeued
    }
}
