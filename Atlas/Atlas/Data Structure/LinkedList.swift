//
//  LinkedList.swift
//  Atlas
//
//  Created by Weslie Chen on 2020/3/8.
//  Copyright © 2020 weslie. All rights reserved.
//

/// A Singly Linked List.
public class LinkedList<T>: List {
    /// Linked List Node.
    class Node<T> {
        var value: T
        var next: Node<T>?
        
        internal init(value: T, next: Node<T>?) {
            self.value = value
            self.next = next
        }
    }
    
    /// Count for nodes in linked list.
    public private(set) var size: Int = 0
    /// Head node of the linked list.
    internal private(set) var head: Node<T>?
    
    public init() { }
    
    /// Initialize a linked list with an array.
    /// - Parameter array: The converting array.
    public init(_ array: [T]) {
        array.forEach(append)
    }
    
    private func node(at index: Int) -> Node<T> {
        _checkRange(index)
        var cur = head
        for _ in 0..<index {
            cur = cur?.next
        }
        return cur!
    }
    
    /// Insert an element at specified index.
    /// - Parameters:
    ///   - value: The element to be inserted.
    ///   - index: The insert index.
    public func insert(_ value: T, at index: Int) {
        _checkAppendingRange(index)
        
        if index == 0 {
            head = Node(value: value, next: head)
        } else {
            let prev = node(at: index - 1)
            prev.next = Node(value: value, next: prev.next)
        }
        
        size += 1
    }
    
    /// Set a new element at specified index.
    /// - Parameters:
    ///   - value: The element to be set.
    ///   - index: The set index.
    /// - Returns: The old value being replaced.
    public func set(_ value: T, at index: Int) -> T {
        let cur = node(at: index)
        let oldValue = cur.value
        cur.value = value
        return oldValue
    }
    
    /// Retrive the element at specified index.
    /// - Parameter index: The index of the element.
    /// - Returns: The node's value at specified index.
    public func get(_ index: Int) -> T {
        return node(at: index).value
    }
    
    /// Remove the element at specified index.
    /// - Parameter index: The index of the element.
    /// - Returns: The element's value to be removed.
    @discardableResult
    public func remove(at index: Int) -> T {
        _checkRange(index)
        
        var cur = head
        if index == 0 {
            head = head?.next
        } else {
            let prev = node(at: index - 1)
            cur = prev.next
            prev.next = cur?.next
        }
        size -= 1
        return cur!.value
    }
    
    /// Remove all nodes from the linked list.
    public func removeAll() {
        size = 0
        head = nil
    }
    
    /// The array format description of the linked list.
    public var description: String {
        var desc = "["
        
        var cur = head
        for i in 0..<size {
            if let value = cur?.value {
                desc += "\(value)"
            }
            if i != size - 1 {
                desc += " -> "
            }
            cur = cur?.next
        }
        
        desc += "]"
        return desc
    }
    
    public var array: [T] {
        var res: [T] = []
        var cur = head
        while cur != nil {
            res.append(cur!.value)
            cur = cur?.next
        }
        return res
    }
}

extension LinkedList where T: Comparable {
    /// Judge whether the linked list contains an element.
    /// - Parameter value: The element's value.
    /// - Returns: Whether the linked list contains an element.
    public func contains(_ value: T) -> Bool {
        return index(of: value) != -1
    }
    
    /// Find out the first index of an element in a linked list
    /// - Parameter value: The element's value to be find.
    /// - Returns: The first index of an element, `-1` when not found.
    public func index(of value: T) -> Int {
        var cur = head
        for i in 0..<size {
            if cur?.value == value {
                return i
            }
            cur = cur?.next
        }
        return -1
    }
}

