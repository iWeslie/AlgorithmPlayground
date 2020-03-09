//
//  AtlasTests.swift
//  AtlasTests
//
//  Created by Weslie Chen on 2020/3/8.
//  Copyright © 2020 weslie. All rights reserved.
//

import XCTest
@testable import Atlas

class AtlasTests: XCTestCase {

    func testAddOrAppendElements() {
        // Given
        let list = LinkedList<Int>()
        
        // When
        list.insert(0, at: 0)
        
        // Then
        XCTAssertEqual(list.size, 1)
        XCTAssertTrue(list.contains(0))
        XCTAssertEqual(list.get(0), 0)
        XCTAssertEqual(list.description, "[0]")
        XCTAssertEqual(list.index(of: 0), 0)
        XCTAssertEqual(list.index(of: 1), -1)
        XCTAssertFalse(list.isEmpty)
        
        print(list)
    }

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    func testBinaryTree() {
        let bst = BST<Int>([7, 4, 9, 2, 5, 8, 11, 1, 3, 12])
        
    }

}
