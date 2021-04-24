//
//  CollectionViewHelperTestCases.swift
//  MauriKitTests
//
//  Created by Mauricio Chirino on 21/04/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import XCTest

final class CollectionViewHelperTestCases: XCTestCase {
    let dummyFrame = CGRect(origin: .zero, size: CGSize(width: 0, height: 0))

    func testCollectionDequeueOnlyCodeCell() {
        // Given
        let testCollectionView = UICollectionView(frame: dummyFrame, collectionViewLayout: .init())
        testCollectionView.register(cellType: DummyCollectionViewCell.self)

        // When
        let dequeued: DummyCollectionViewCell = testCollectionView.dequeue(at: IndexPath(row: 0, section: 0))

        // Verify
        XCTAssert(dequeued.isKind(of: DummyCollectionViewCell.self))
    }

    func testCollectionViewDequeueXibCell() {
        // Given
        let testCollectionView = UICollectionView(frame: dummyFrame, collectionViewLayout: .init())
        testCollectionView.registerNib(MockCollectionCell.self, from: Bundle.module)

        // When
        let dequeued: MockCollectionCell = testCollectionView.dequeue(at: IndexPath(row: 0, section: 0))

        // Verify
        XCTAssert(dequeued.isKind(of: MockCollectionCell.self))
    }
}
