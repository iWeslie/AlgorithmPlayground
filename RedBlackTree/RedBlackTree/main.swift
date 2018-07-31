//
//  main.swift
//  RedBlackTree
//
//  Created by Weslie on 2018/7/30.
//  Copyright © 2018 weslie. All rights reserved.
//

import Foundation

private enum RBTreeColor {
    case red
    case black
}

private enum RotationDirection {
    case left
    case right
}

// MARK: - RBNode

public class RBTreeNode<T: Comparable>: Equatable {
    public typealias RBNode = RBTreeNode<T>
    
    fileprivate var color: RBTreeColor = .black
    fileprivate var key: T?
    var leftChild: RBNode?
    var rightChild: RBNode?
    fileprivate weak var parent: RBNode?
    
    public init(key: T?, leftChild: RBNode?, rightChild: RBNode?, parent: RBNode?) {
        self.key = key
        self.leftChild = leftChild
        self.rightChild = rightChild
        self.parent = parent
        
        self.leftChild?.parent = self
        self.rightChild?.parent = self
    }
    
    public convenience init(key: T) {
        self.init(key: key, leftChild: RBNode(), rightChild: RBNode(), parent: RBNode())
    }
    
    // For initialising the nullLeaf
    public convenience init() {
        self.init(key: nil, leftChild: nil, rightChild: nil, parent: nil)
        self.color = .black
    }
    
    var isRoot: Bool {
        return parent == nil
    }
    
    var isLeaf: Bool {
        return rightChild == nil && leftChild == nil
    }
    
    var isNullLeaf: Bool {
        return key == nil && isLeaf && color == .black
    }
    
    var isLeftChild: Bool {
        return parent?.leftChild === self
    }
    
    var isRightChild: Bool {
        return parent?.rightChild === self
    }
    
    public static func == (lhs: RBTreeNode<T>, rhs: RBTreeNode<T>) -> Bool {
        return true
    }
}



