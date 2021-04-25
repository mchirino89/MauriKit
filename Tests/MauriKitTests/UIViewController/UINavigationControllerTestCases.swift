//
//  UINavigationControllerTestCases.swift
//  
//
//  Created by Mauricio Chirino on 25/4/21.
//

import SnapshotTesting
import XCTest
@testable import MauriKit

final class UINavigationControllerTestCases: XCTestCase {
    func testNavigationClearanceUI() {
        // Given
        let sut = buildSUT()

        // When
        sut.setTranslucent()

        verifySnapshot(for: sut, testName: #function)
    }
}

private extension UINavigationControllerTestCases {
    func buildSUT() -> UINavigationController {
        let dummyViewController = DummyParentViewController()
        dummyViewController.setLarge(title: "Dummy root controller")
        let mockNavigationController = UINavigationController(rootViewController: dummyViewController)
        mockNavigationController.overrideUserInterfaceStyle = .light

        return mockNavigationController
    }

    func verifySnapshot(for sut: UIViewController, testName: String) {
        assertSnapshot(matching: sut, as: .image(on: .iPhone8, precision: 0.99), testName: testName)
    }
}
