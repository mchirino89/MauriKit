//
//  RoundViewTestCases.swift
//  
//
//  Created by Mauricio Chirino on 11/01/21.
//

import UIKit
import XCTest

final class RoundViewTestCases: XCTestCase {
    func testRoundingHelper() {
        // Given
        let dummyView = UIView(frame: .init(origin: .zero, size: CGSize(width: 100, height: 100)))

        // When
        dummyView.rounded()

        // Then
        XCTAssertEqual(dummyView.layer.cornerRadius, dummyView.frame.height / 2)
    }
}

