//
//  StackAndQueueTests.swift
//  AtlasTests
//
//  Created by Weslie Chen on 2020/3/13.
//  Copyright © 2020 weslie. All rights reserved.
//

import Atlas
import XCTest

class StackAndQueueTests: XCTestCase {
    
    func testStackPushPop() {
        // Given
        let stack = Stack([1, 2, 3])
        
        XCTAssertEqual(stack.peak, 3)
        XCTAssertEqual(stack.pop(), 3)
        XCTAssertEqual(stack.size, 2)
        
        stack.push(4)
        XCTAssertEqual(stack.peak, 4)
        XCTAssertEqual(stack.size, 3)
        
        XCTAssertFalse(stack.isEmpty)
        stack.clear()
        XCTAssertTrue(stack.isEmpty)
    }
    
    func testQueue() {
        // Given
        let queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(4)
        queue.enqueue(5)
        
        XCTAssertEqual(queue.front, 1)
        XCTAssertEqual(queue.size, 4)
        
        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertEqual(queue.dequeue(), 2)
        XCTAssertEqual(queue.size, 2)
        
        XCTAssertFalse(queue.isEmpty)
        queue.clear()
        XCTAssertTrue(queue.isEmpty)
    }

}
