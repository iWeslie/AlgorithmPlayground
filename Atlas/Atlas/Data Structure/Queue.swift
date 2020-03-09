//
//  Queue.swift
//  Atlas
//
//  Created by Weslie Chen on 2020/3/9.
//  Copyright © 2020 weslie. All rights reserved.
//

/// An abtract queue with generic type.
public class Queue<T>: CustomStringConvertible {
    private var elements: [T] = []
    
    public var size: Int {
        return elements.count
    }
    
    public var isEmpty: Bool {
        return size == 0
    }
    
    public func enqueue(_ element: T) {
        elements.append(element)
    }
    
    public func dequeue(_ element: T) {
        elements.removeFirst()
    }
    
    public var front: T? {
        return elements.first
    }
    
    public func clear() {
        elements.removeAll()
    }
    
    public var description: String {
        var desc = "Queue: >"
        elements.forEach { desc += "\($0), " }
        desc.removeLast(2)
        desc += ">"
        return desc
    }
}
