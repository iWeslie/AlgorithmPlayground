//
//  LinkedListTests.swift
//  AtlasTests
//
//  Created by Weslie Chen on 2020/3/13.
//  Copyright © 2020 weslie. All rights reserved.
//

import Atlas
import XCTest

class LinkedListTests: XCTestCase {
    
    func testLinkedListInsertValueToHead() {
        // Given
        let array = [1, 3, 5, 6, 7, 9]
        let list = LinkedList(array)
        
        // When
        list.insert(0, at: 0)
        // [0 -> 1 -> 3 -> 5 -> 6 -> 7 -> 9]
        
        // Then
        XCTAssertEqual(list.array, [0] + array)
        XCTAssertEqual(list.size, array.count + 1)
        XCTAssertTrue(list.contains(0))
        XCTAssertEqual(list.get(0), 0)
        XCTAssertEqual(list.get(1), 1)
        XCTAssertEqual(list.index(of: 0), 0)
        XCTAssertEqual(list.index(of: 1), 1)
        XCTAssertEqual(list.index(of: 2), -1)
        XCTAssertFalse(list.isEmpty)
    }
    
    func testLinkedListInsertValueToTail() {
        // Given
        let array = [1, 3, 5, 6, 7, 9]
        let list = LinkedList(array)
        
        // When
        list.insert(0, at: array.count)
        // [1 -> 3 -> 5 -> 6 -> 7 -> 9 -> 0]
        
        // Then
        XCTAssertEqual(list.array, array + [0])
        XCTAssertEqual(list.size, array.count + 1)
        XCTAssertTrue(list.contains(0))
        XCTAssertEqual(list.get(0), 1)
        XCTAssertEqual(list.get(array.count - 1), 9)
        XCTAssertEqual(list.get(array.count), 0)
        XCTAssertEqual(list.index(of: 0), array.count)
        XCTAssertEqual(list.index(of: 1), 0)
        XCTAssertEqual(list.index(of: 2), -1)
        XCTAssertFalse(list.isEmpty)
    }
    
    func testLinkedListInsertValue() {
        // Given
        let array = [1, 3, 5, 6, 7, 9]
        let list = LinkedList(array)
        
        // When
        list.insert(0, at: 3)
        // [1 -> 3 -> 5 -> 0 -> 6 -> 7 -> 9]
        
        // Then
        XCTAssertEqual(list.array, [1, 3, 5, 0, 6, 7, 9])
        XCTAssertEqual(list.size, array.count + 1)
        XCTAssertTrue(list.contains(0))
        XCTAssertEqual(list.get(0), 1)
        XCTAssertEqual(list.get(3), 0)
        XCTAssertEqual(list.get(array.count), 9)
        XCTAssertEqual(list.index(of: 0), 3)
        XCTAssertEqual(list.index(of: 1), 0)
        XCTAssertEqual(list.index(of: 2), -1)
        XCTAssertFalse(list.isEmpty)
    }
    
    func testLinkedListRemoveValue() {
        // Given
        let array = [1, 3, 5, 6, 7, 9]
        var list = LinkedList(array)
        
        // When
        list.remove(at: 0)
        // [3 -> 5 -> 6 -> 7 -> 9]
        
        XCTAssertEqual(list.array, [3, 5, 6, 7, 9])
        XCTAssertEqual(list.size, array.count - 1)
        XCTAssertFalse(list.contains(1))
        XCTAssertEqual(list.get(0), 3)
        XCTAssertEqual(list.get(1), 5)
        XCTAssertEqual(list.get(array.count - 2), 9)
        XCTAssertEqual(list.index(of: 1), -1)
        XCTAssertEqual(list.index(of: 3), 0)
        XCTAssertFalse(list.isEmpty)
        
        // When
        list = LinkedList([9, 0])
        list.remove(at: 1)
        // [9]
        XCTAssertEqual(list.array, [9])
        XCTAssertEqual(list.size, 1)
        XCTAssertFalse(list.contains(3))
        XCTAssertEqual(list.get(0), 9)
        XCTAssertEqual(list.index(of: 9), 0)
        XCTAssertEqual(list.index(of: 1), -1)
        XCTAssertFalse(list.isEmpty)
        
        // When
        list.remove(at: 0)
        // []
        XCTAssertEqual(list.array, [])
        XCTAssertEqual(list.size, 0)
        XCTAssertFalse(list.contains(9))
        XCTAssertEqual(list.index(of: 9), -1)
        XCTAssertEqual(list.index(of: 1), -1)
        XCTAssertTrue(list.isEmpty)
        
        // When
        list = LinkedList(array)
        XCTAssertFalse(list.isEmpty)
        // Then
        list.removeAll()
        XCTAssertTrue(list.isEmpty)
    }

}
