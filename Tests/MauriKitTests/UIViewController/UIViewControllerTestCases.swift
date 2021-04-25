//
//  UIViewControllerTestCases.swift
//  MauriKitTests
//
//  Created by Mauricio Chirino on 18/10/20.
//  Copyright © 2020 Mauricio Chirino. All rights reserved.
//

import XCTest
@testable import MauriKit

final class UIViewControllerTestCases: XCTestCase {
    var dummyParent: DummyParentViewController!
    var dummyChild: DummyChildViewController!

    override func tearDown() {
        super.tearDown()
        dummyParent = nil
        dummyChild = nil
    }

    func testViewControllerVisibility() {
        // Given
        let dummyViewController = UIViewController()

        // When
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = dummyViewController
        window.makeKeyAndVisible()

        // Then
        XCTAssert(dummyViewController.isVisible)
    }

    func testChildViewControllerAddition() {
        givenInitialSetupForParentAndChildControllers()
        whenChildIsAddedIntoParent()
        verifyParentContainsChildren()
    }

    func testChildViewControllerRemotion() {
        givenInitialSetupForParentAndChildControllers()
        whenChildIsAddedIntoParent()
        whenChildIsRemovedFromParent()
        verifyChildrenIsNotContainedWithinParent()
    }
}

private extension UIViewControllerTestCases {
    func givenInitialSetupForParentAndChildControllers() {
        dummyParent = DummyParentViewController()
        dummyChild = DummyChildViewController()
        _ = dummyParent.view
    }

    func whenChildIsAddedIntoParent() {
        dummyParent.addExternal(viewController: dummyChild, on: dummyParent.containerView)
    }

    func whenChildIsRemovedFromParent() {
        dummyChild.removeFromParent()
    }

    func verifyParentContainsChildren() {
        XCTAssert(dummyParent.children.contains(dummyChild))
        XCTAssertEqual(dummyChild.view.bounds, dummyParent.containerView.bounds)
    }

    func verifyChildrenIsNotContainedWithinParent() {
        XCTAssertFalse(dummyParent.children.contains(dummyChild))
    }
}
