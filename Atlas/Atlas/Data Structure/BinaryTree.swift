//
//  BinaryTree.swift
//  Atlas
//
//  Created by Weslie Chen on 2020/3/9.
//  Copyright © 2020 weslie. All rights reserved.
//

public class BinaryTreeNode<T> {
    var value: T
    var left: BinaryTreeNode<T>?
    var right: BinaryTreeNode<T>?
    var parent: BinaryTreeNode<T>?
    
    init(_ value: T,
         left: BinaryTreeNode<T>? = nil,
         right: BinaryTreeNode<T>? = nil,
         parent: BinaryTreeNode<T>? = nil)
    {
        self.value = value
        self.left = left
        self.right = right
        self.parent = parent
    }
}

public protocol BinaryTree: CustomStringConvertible {
    associatedtype T
    typealias Node = BinaryTreeNode<T>
    
    var size: Int { get set }
    var root: Node? { get set }
    
    func contains(_ value: T) -> Bool
}

extension BinaryTree {
    public var isEmpty: Bool {
        return size == 0
    }
    
    public mutating func clear() {
        root = nil
        size = 0
    }
    
    public var description: String {
        return treeString(root!) { (node: Node) in
            return ("\(node.value)", node.left, node.right)
        }
    }
    
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
    
    /// Traverse the Binary Tree by level-order
    public func levelOrder(process: Process) {
        
    }
    
    private func _traversePreOrder(node: Node?, process: Process) {
        guard let node = node else { return }
        
        process(node.value)
        _traversePreOrder(node: node.left, process: process)
        _traversePreOrder(node: node.right, process: process)
    }
    
    private func _traverseInOrder(node: Node?, process: Process) {
        guard let node = node else { return }
        
        _traverseInOrder(node: node.left, process: process)
        process(node.value)
        _traverseInOrder(node: node.right, process: process)
    }
    
    private func _traversePostOrder(node: Node?, process: Process) {
        guard let node = node else { return }
        
        _traversePostOrder(node: node.left, process: process)
        _traversePostOrder(node: node.right, process: process)
        process(node.value)
    }
}
