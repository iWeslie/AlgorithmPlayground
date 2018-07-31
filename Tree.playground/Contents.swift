import UIKit

//: # Binary Tree

/*
 A general-purpose binary tree.
 Nodes don't have a reference to their parent.
 */
public indirect enum BinaryTree<T> {
    case node(BinaryTree<T>, T, BinaryTree<T>)
    case empty
    
    public var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
}

extension BinaryTree: CustomStringConvertible {
    public var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left: [\(left.description)], right: [\(right.description)]"
        case .empty:
            return ""
        }
    }
}

extension BinaryTree {
    
    public func traverseInOrder(process: (T) -> Void) {
        if case let .node(left, value, right) = self {
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    public func traversePreOrder(process: (T) -> Void) {
        if case let .node(left, value, right) = self {
            process(value)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    
    public func traversePostOrder(process: (T) -> Void) {
        if case let .node(left, value, right) = self {
            left.traversePostOrder(process: process)
            right.traversePostOrder(process: process)
            process(value)
        }
    }
}
extension BinaryTree {
    func invert() -> BinaryTree {
        if case let .node(left, value, right) = self {
            return .node(right.invert(), value, left.invert())
        } else {
            return .empty
        }
    }
}

public class BinarySearchTree<T: Comparable> {
    private(set) public var value: T
    private(set) public var parent: BinarySearchTree?
    private(set) public var left: BinarySearchTree?
    private(set) public var right: BinarySearchTree?
    
    public init(value: T) {
        self.value = value
    }
    
    public var isRoot: Bool {
        return parent == nil
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }
    
    public var hasLeftChild: Bool {
        return left != nil
    }
    
    public var hasRightChild: Bool {
        return right != nil
    }
    
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    
    public var hasBothChildren: Bool {
        return hasLeftChild && hasRightChild
    }
    
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
    /// Inserting nodes
    public func insert(value: T) {
        if value < self.value {
            if let left = left {
                left.insert(value: value)
            } else {
                left = BinarySearchTree(value: value)
                left?.parent = self
            }
        } else {
            if let right = right {
                right.insert(value: value)
            } else {
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
    }
    
    /// Searching the tree
    public func search(value: T) -> BinarySearchTree? {
        if value < self.value {
            return search(value: value)
        } else if value > self.value {
            return search(value: value)
        } else {
            return self
        }
    }
    
    /// Searching the tree non-recursive
    public func search(_ value: T) -> BinarySearchTree? {
        var node: BinarySearchTree? = self
        while let n = node {
            if value < n.value {
                node = n.left
            } else if value > n.value {
                node = n.right
            } else {
                return node
            }
        }
        return nil
    }
    
    /// Depth and height
    public var height: Int {
        if isLeaf {
            return 0
        } else {
            return 1 + max(left?.height ?? 0, right?.height ?? 0)
        }
    }
    public var depth: Int {
        var node = self
        var edges = 0
        while let parent = node.parent {
            node = parent
            edges += 1
        }
        return edges
    }
    
    /// Deleting nodes
    private func reconnectParentTo(node: BinarySearchTree?) {
        
    }
    public func minimum() -> BinarySearchTree {
        var node = self
        while let next = node.left {
            node = next
        }
        return node
    }
    public func maximum() -> BinarySearchTree {
        var node = self
        while let next = node.right {
            node = next
        }
        return node
    }
    @discardableResult public func remove() -> BinarySearchTree? {
        let replacement: BinarySearchTree?
        
        // Replacement for current node can be either biggest one on the left or
        // smallest one on the right, whichever is not nil
        if let right = right {
            replacement = right.minimum()
        } else if let left = left {
            replacement = left.maximum()
        } else {
            replacement = nil
        }
        
        replacement?.remove()
        // Place the replacement on current node's position
        replacement?.right = right
        replacement?.left = left
        right?.parent = replacement
        left?.parent = replacement
        
        reconnectParentTo(node: replacement)
        
        // The current node is no longer part of the tree, so clean it up.
        parent = nil
        left = nil
        right = nil
        
        return replacement
    }
    
    /// Predecessor and successor
    public func predecessor() -> BinarySearchTree? {
        if let left = left {
            return left.maximum()
        } else {
            var node = self
            while let parent = node.parent {
                if parent.value < value { return parent }
                node = parent
            }
            return nil
        }
    }
    public func successor() -> BinarySearchTree? {
        if let right = right {
            return right.minimum()
        } else {
            var node = self
            while let parent = node.parent {
                if parent.value > value { return parent }
                node = parent
            }
            return nil
        }
    }
    
    /// Is the search tree valid?
    public func isBST(minValue: T, maxValue: T) -> Bool {
        if value < minValue || value > maxValue { return false }
        let leftBST = left?.isBST(minValue: minValue, maxValue: value) ?? true
        let rightBST = right?.isBST(minValue: value, maxValue: maxValue) ?? true
        return leftBST && rightBST
    }
}

extension BinarySearchTree {
    public convenience init(array: [T]) {
        precondition(array.count > 0)
        self.init(value: array.first!)
        for value in array.dropFirst() {
            insert(value: value)
        }
    }
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = right {
            s += " -> (\(right.description))"
        }
        return s
    }
}

let tree = BinarySearchTree(array: [7, 2, 5, 10, 9, 1])

if let node1 = tree.search(1) {
    node1.parent
    node1.insert(value: 100)
    node1.description
    tree.isBST(minValue: Int.min, maxValue: Int.max)
}

public enum BST<T: Comparable> {
    case empty
    case leaf(T)
    indirect case Node(BST, T, BST)
    
    public var count: Int {
        switch self {
        case .empty:
            return 0
        case .leaf:
            return 1
        case let .Node(left, _, right):
            return left.count + 1 + right.count
        }
    }
    
    public var height: Int {
        switch self {
        case .empty:
            return -1
        case .leaf:
            return 0
        case let .Node(left, _, right):
            return 1 + max(left.height, right.height)
        }
    }
    
    public func insert(newValue: T) -> BST {
        switch self {
        case .empty:
            return .leaf(newValue)
        case .leaf(let value):
            if newValue < value {
                return .Node(.leaf(newValue), value, .empty)
            } else {
                return .Node(.empty, value, .leaf(newValue))
            }
        case .Node(let left, let value, let right):
            if newValue < value {
                return .Node(left.insert(newValue: newValue), value, right)
            } else {
                return .Node(left, value, right.insert(newValue: newValue))
            }
        }
    }
}

//: # Red-Black Tree
// Every node is either red or black
// The root is black
// Every leaf (nullLeaf) is black
// If a node is red, then both its children are black
// For each node, all paths from the node to descendant leaves contain the same number of black nodes
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
    
    var grandparent: RBNode? {
        return parent?.parent
    }
    
    var sibling: RBNode? {
        if isLeftChild {
            return parent?.rightChild
        } else {
            return parent?.leftChild
        }
    }
    
    var uncle: RBNode? {
        return parent?.sibling
    }
}

// MARK: - RedBlackTree
public class RedBlackTree<T: Comparable> {
    public typealias RBNode = RBTreeNode<T>
    
    fileprivate(set) var root: RBNode
    fileprivate(set) var size = 0
    fileprivate let nullLeaf = RBNode()
    
    public init() {
        root = nullLeaf
    }
}

// MARK: - Equatable Protocol
extension RBTreeNode {
    public static func == <T>(lhs: RBTreeNode<T>, rhs: RBTreeNode<T>) -> Bool {
        return lhs.key == rhs.key
    }
}

// MARK: - Finding a nodes successor
extension RBTreeNode {
    /*
     * Returns the inorder successor node of a node
     * The successor is a node with the next larger key value of the current node
     */
    public func getSuccessor() -> RBNode? {
        // If node has right child: successor min of this right tree
        if let rightChild = self.rightChild {
            if !rightChild.isNullLeaf {
                return rightChild.minimum()
            }
        }
        // Else go upward until node left child
        print("While current is left child of parent, parent is successor.")
        var currentNode = self
        var parent = currentNode.parent
        while currentNode.isRightChild {
            if let parent = parent {
                currentNode = parent
            }
            parent = currentNode.parent
        }
        return parent
    }
}

// MARK: - Searching
extension RBTreeNode {
    /*
     * Returns the node with the minimum key of the current subtree
     */
    public func minimum() -> RBNode? {
        if let leftChild = leftChild {
            if !leftChild.isNullLeaf {
                return leftChild.minimum()
            }
            return self
        }
        return self
    }
    /*
     * Returns the node with the maximum key of the current subtree
     */
    public func maximum() -> RBNode? {
        if let rightChild = rightChild {
            if !rightChild.isNullLeaf {
                return rightChild.maximum()
            }
            return self
        }
        return self
    }
}

extension RedBlackTree {
    /*
     * Returns the node with the given key |input| if existing
     */
    public func search(input: T) -> RBNode? {
        return search(key: input, node: root)
    }
    
    /*
     * Returns the node with given |key| in subtree of |node|
     */
    fileprivate func search(key: T, node: RBNode?) -> RBNode? {
        // If node nil -> key not found
        guard let node = node else {
            return nil
        }
        // If node is nullLeaf == semantically same as if nil
        if !node.isNullLeaf {
            if let nodeKey = node.key {
                // Node found
                if key == nodeKey {
                    return node
                } else if key < nodeKey {
                    return search(key: key, node: node.leftChild)
                } else if key > nodeKey {
                    return search(key: key, node: node.rightChild)
                }
            }
        }
        return nil
    }
}

// MARK: - Finding maximum and minimum value
extension RedBlackTree {
    /*
     * Returns the minimum key value of the whole tree
     */
    public func minValue() -> T? {
        guard let minNode = root.minimum() else { return nil }
        return minNode.key
    }
    /*
     * Returns the maximum key value of the whole tree
     */
    public func maxValue() -> T? {
        guard let maxNode = root.maximum() else { return nil }
        return maxNode.key
    }
}

// MARK: - Inserting new nodes
extension RedBlackTree {
    /*
     * Insert a node with key |key| into the tree
     * 1. Perform normal insert operation as in a binary search tree
     * 2. Fix red-black properties
     * Runntime: O(log n)
     */
    public func insert(key: T) {
        if root.isNullLeaf {
            root = RBNode(key: key)
        } else {
            insert(input: RBNode(key: key), node: root)
        }
    }
    
    /*
     * Nearly identical insert operation as in a binary search tree
     * Differences: All nil pointers are replaced by the nullLeaf, we color the inserted node red,
     * after inserting we call insertFixup to maintain the red-black properties
     */
    public func insert(input: RBNode, node: RBNode) {
        guard let inputKey = input.key, let nodeKey = node.key else {
            return
        }
        if inputKey < nodeKey {
            guard let child = node.leftChild else {
                addAsLeftChild(child: input, parent: node)
                return
            }
            if child.isNullLeaf {
                addAsLeftChild(child: input, parent: node)
            } else {
                insert(input: input, node: child)
            }
        } else {
            guard let child = node.rightChild else {
                addAsRightChild(child: input, parent: node)
                return
            }
            if child.isNullLeaf {
                addAsRightChild(child: input, parent: node)
            } else {
                insert(input: input, node: child)
            }
        }
    }
    
    private func addAsLeftChild(child: RBNode, parent: RBNode) {
        parent.leftChild = child
        child.parent = parent
        child.color = .red
        insertFixup(node: child)
    }
    private func addAsRightChild(child: RBNode, parent: RBNode) {
        parent.rightChild = child
        child.parent = parent
        child.color = .red
        insertFixup(node: child)
    }
    
    /*
     * Fixes possible violations of the red-black property after insertion
     * Only violation of red-black properties occurs at inserted node |z| and z.parent
     * We have 3 distinct cases: case 1, 2a and 2b
     * - case 1: may repeat, but only h/2 steps, where h is the height of the tree
     * - case 2a -> case 2b -> red-black tree
     * - case 2b -> red-black tree
     */
    private func insertFixup(node z: RBNode) {
        
    }
}
