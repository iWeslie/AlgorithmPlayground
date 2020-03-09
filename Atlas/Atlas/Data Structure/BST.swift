//
//  BST.swift
//  Atlas
//
//  Created by Weslie Chen on 2020/3/9.
//  Copyright © 2020 weslie. All rights reserved.
//

public class BST<T: Comparable>: BinaryTree, CustomStringConvertible {
    public class Node<T> {
        var value: T
        var left: Node?
        var right: Node?
        var parent: Node?
        
        init(_ value: T,
             left: Node? = nil,
             right: Node? = nil,
             parent: Node? = nil)
        {
            self.value = value
            self.left = left
            self.right = right
            self.parent = parent
        }
    }
    
    public var size = 0
    internal var root: Node<T>?
    
    public var isEmpty: Bool {
        return size == 0
    }
    
    public init() { }
    public init(_ array: [T]) {
        array.forEach(insert)
    }
    
    public func clear() {
        root = nil
        size = 0
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
    
    public func remove(_ node: Node<T>) {
        
    }
    
    public func contains(_ value: T) -> Bool {
        return node(for: value) != nil
    }
    
    private func node(for value: T) -> Node<T>? {
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
    
    private func _predecessor(_ node: Node<T>) -> Node<T>? {
        var cur = node.left
        while cur?.right != nil {
            cur = cur?.right
        }
        return cur
    }
    
    private func _successor(_ node: Node<T>) -> Node<T>? {
        var cur = node.left
        while cur?.left != nil {
            cur = cur?.left
        }
        return cur
    }
    
}

extension BST {
    public typealias Process = (T) -> Void
    
    /// Traverse the Binary Tree by pre-order
    public func preOrder(process: Process) {
        _traversePreOrder(node: root, process: process)
    }
    
    /// Traverse the Binary Tree by in-order
    public func inOrder(process: Process) {
        _traverseInOrder(node: root, process: process)
    }
    
    /// Traverse the Binary Tree by post-order
    public func postOrder(process: Process) {
        _traversePostOrder(node: root, process: process)
    }
    
    public func levelOrder(process: Process) {
        
    }
    
    private func _traversePreOrder(node: Node<T>?, process: Process) {
        guard let node = node else { return }
        
        process(node.value)
        _traversePreOrder(node: node.left, process: process)
        _traversePreOrder(node: node.right, process: process)
    }
    
    private func _traverseInOrder(node: Node<T>?, process: Process) {
        guard let node = node else { return }
        
        _traverseInOrder(node: node.left, process: process)
        process(node.value)
        _traverseInOrder(node: node.right, process: process)
    }
    
    private func _traversePostOrder(node: Node<T>?, process: Process) {
        guard let node = node else { return }
        
        _traversePostOrder(node: node.left, process: process)
        _traversePostOrder(node: node.right, process: process)
        process(node.value)
    }
    
    public var description: String {
        return treeString(root!) { (node: Node<T>) in
            return ("\(node.value)", node.left, node.right)
        }
    }
}
