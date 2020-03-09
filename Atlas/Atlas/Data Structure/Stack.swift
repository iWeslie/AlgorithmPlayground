//
//  Stack.swift
//  Atlas
//
//  Created by Weslie Chen on 2020/3/9.
//  Copyright © 2020 weslie. All rights reserved.
//

/// An abtract stack with generic type.
public class Stack<T>: CustomStringConvertible {
    private var elements: [T] = []
    
    public var size: Int {
        return elements.count
    }
    
    public var isEmpty: Bool {
        return size == 0
    }
    
    public var peak: T? {
        return elements.last
    }
    
    public func push(_ element: T) {
        elements.append(element)
    }
    
    public func pop() -> T {
        return elements.removeLast()
    }
    
    public func clear() {
        elements.removeAll()
    }
    
    public var description: String {
        var desc = "Stack: ["
        elements.forEach { desc += "\($0), " }
        desc.removeLast(2)
        desc += "<"
        return desc
    }
}
