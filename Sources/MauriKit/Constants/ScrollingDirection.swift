//
//  ScrollingDirection.swift
//  
//
//  Created by Mauricio Chirino on 04/01/21.
//

import UIKit

public enum ScrollingDirection {
    case horizontal
    case vertical

    public var groupSize: NSCollectionLayoutSize {
        switch self {
        case .vertical:
            return NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                          heightDimension: .fractionalHeight(0.2))
        case .horizontal:
            return NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6),
                                          heightDimension: .fractionalHeight(1))
        }
    }

    public var orthogonalBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior {
        self == .vertical ? .none : .continuous
    }

    public func buildGroup(for item: NSCollectionLayoutItem) -> NSCollectionLayoutGroup {
        switch self {
        case .vertical:
            return NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        case .horizontal:
            return NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
        }
    }
}
