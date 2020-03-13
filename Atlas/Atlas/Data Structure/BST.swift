//
//  BST.swift
//  Atlas
//
//  Created by Weslie Chen on 2020/3/9.
//  Copyright © 2020 weslie. All rights reserved.
//

/// Binary Search Tree
public class BST<T: Comparable>: BinaryTree {
    
    public var size = 0
    public var root: Node?
    
    public init() { }
    public init(_ array: [T]) {
        array.forEach(insert)
    }
    
    public func insert(_ value: T) {
        guard var parent = root else {
            root = Node(value)
            size += 1
            return
        }
        
        var node = root
        while let cur = node {
            parent = cur
            
            if cur.value == value {
                return
            } else if value < cur.value {
                node = cur.left
            } else if value > cur.value {
                node = cur.right
            }
        }
        
        if value < parent.value {
            parent.left = Node(value)
        } else {
            parent.right = Node(value)
        }
        
        size += 1
    }
    
    public func remove(_ value: T) {
        
    }
    
    public func remove(_ node: Node) {
        
    }
    
    public func contains(_ value: T) -> Bool {
        return node(for: value) != nil
    }
    
    private func node(for value: T) -> Node? {
        var node = root
        while let cur = node {
            if value == cur.value {
                return cur
            } else if value < cur.value {
                node = cur.left
            } else if value > cur.value {
                node = cur.right
            }
        }
        return nil
    }
    
    private func _predecessor(_ node: Node) -> Node? {
        var cur = node.left
        while cur?.right != nil {
            cur = cur?.right
        }
        return cur
    }
    
    private func _successor(_ node: Node) -> Node? {
        var cur = node.left
        while cur?.left != nil {
            cur = cur?.left
        }
        return cur
    }
    
}
