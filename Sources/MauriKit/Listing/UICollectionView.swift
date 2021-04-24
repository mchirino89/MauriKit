//
//  UICollectionView.swift
//  MauriKit
//
//  Created by Mauricio Chirino on 1/4/20.
//  Copyright © 2020 Mauricio Chirino. All rights reserved.
//

import UIKit

public extension UICollectionView {
    func register<T: UICollectionViewCell>(cellType: T.Type) {
        register(cellType.self, forCellWithReuseIdentifier: String(describing: cellType.self))
    }

    func registerNib<T: UICollectionViewCell>(_: T.Type, from bundle: Bundle = Bundle(for: T.self)) {
        let xibIdentifier = String(describing: T.self).components(separatedBy: ".").last ?? ""
        let nib = UINib(nibName: xibIdentifier, bundle: bundle)

        register(nib, forCellWithReuseIdentifier: xibIdentifier)
    }

    func dequeue<T: UICollectionViewCell>(for id: String = String(describing: T.self),
                                          at indexPath: IndexPath) -> T {
        guard let dequeued = self.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as? T else {
            preconditionFailure("Check your UICollectionViewCell settings for \(T.self)")
        }

        return dequeued
    }
}
