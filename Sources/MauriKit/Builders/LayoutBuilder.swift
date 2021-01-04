//
//  LayoutBuilder.swift
//  
//
//  Created by Mauricio Chirino on 13/12/20.
//

import UIKit

public struct LayoutBuilder {
    /// Returns a 2 x 2 grid layout with dynamic size cells and _standard_ padding between its elements as well as adaptive scrolling behavior [Source](https://developer.apple.com/documentation/uikit/views_and_controls/collection_views/implementing_modern_collection_views)
    /// - Returns: `UICollectionViewCompositionalLayout` assembled grid layout
    /// - Parameter direction: scroll direction. Default `.vertical` type
    public static func assembleGridLayout(direction: ScrollingDirection = .vertical) -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let group = direction.buildGroup(for: item)
        let spacing = UIConstants.standardPadding
        group.interItemSpacing = .flexible(spacing)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: spacing, bottom: 0, trailing: spacing)
        section.orthogonalScrollingBehavior = direction.orthogonalBehavior

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
