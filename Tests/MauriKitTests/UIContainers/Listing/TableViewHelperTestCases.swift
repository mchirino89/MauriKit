//
//  TableViewHelperTestCases.swift
//  
//
//  Created by Mauricio Chirino on 24/4/21.
//

import XCTest

final class TableViewHelperTestCases: XCTestCase {
    let dummyFrame = CGRect(origin: .zero, size: CGSize(width: 0, height: 0))

    func testTableDequeueOnlyCodeCell() {
        // Given
        let testTableView = UITableView(frame: dummyFrame, style: .plain)
        testTableView.register(cellType: DummyTableViewCell.self)

        // When
        let dequeued: DummyTableViewCell = testTableView.dequeue()

        // Verify
        XCTAssert(dequeued.isKind(of: DummyTableViewCell.self))
    }

    func testTableViewDequeueXibCell() {
        // Given
        let testTableView = UITableView(frame: dummyFrame, style: .plain)
        testTableView.registerNib(for: MockTableViewCell.self, from: Bundle.module)

        // When
        let dequeued: MockTableViewCell = testTableView.dequeue()

        // Verify
        XCTAssert(dequeued.isKind(of: MockTableViewCell.self))
    }
}
