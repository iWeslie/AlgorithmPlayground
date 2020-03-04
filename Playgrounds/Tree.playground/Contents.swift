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

//: # Heap
// A heap is a binary tree inside an array, so it does not use parent/child pointers. A heap is sorted based on the "heap property" that determines the order of the nodes in the tree.
// Common uses for heap:

// To build priority queues.
// To support heap sorts.
// To compute the minimum (or maximum) element of a collection quickly.
// To impress your non-programmer friends.

public struct Heap<T> {
    /** The array that stores the heap's nodes. */
    var nodes = [T]()
    
    /**
     * Determines how to compare two nodes in the heap.
     * Use '>' for a max-heap or '<' for a min-heap,
     * or provide a comparing method if the heap is made
     * of custom elements, for example tuples.
     */
    private var orderCriteria: (T, T) -> Bool
    
    /**
     * Creates an empty heap.
     * The sort function determines whether this is a min-heap or max-heap.
     * For comparable data types, > makes a max-heap, < makes a min-heap.
     */
    public init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }
    
    /**
     * Creates a heap from an array. The order of the array does not matter;
     * the elements are inserted into the heap in the order determined by the
     * sort function. For comparable data types, '>' makes a max-heap,
     * '<' makes a min-heap.
     */
    public init(array: [T],sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(from: array)
    }
    
    /**
     * Configures the max-heap or min-heap from an array, in a bottom-up manner.
     * Performance: This runs pretty much in O(n).
     */
    private mutating func configureHeap(from array: [T]) {
        nodes = array
        for i in stride(from: (nodes.count / 2 - 1), through: 0, by: -1) {
            shiftDown(i)
        }
        shiftDown(0)
    }
    
    public var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    public var count: Int {
        return nodes.count
    }
    
    /**
     * Returns the index of the parent of the element at index i.
     * The element at index 0 is the root of the tree and has no parent.
     */
    @inline(__always) internal func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }
    
    /**
     * Returns the index of the left child of the element at index i.
     * Note that this index can be greater than the heap size, in which case
     * there is no left child.
     */
    @inline(__always) internal func leftChildIndex(ofIndex i: Int) -> Int {
        return 2 * i + 1
    }
    
    /**
     * Returns the index of the right child of the element at index i.
     * Note that this index can be greater than the heap size, in which case
     * there is no right child.
     */
    @inline(__always) internal func rightChildIndex(ofIndex i: Int) -> Int {
        return 2 * i + 2
    }
    
    /**
     * Returns the maximum value in the heap (for a max-heap) or the minimum
     * value (for a min-heap).
     */
    public func peek() -> T? {
        return nodes.first
    }
    
    /**
     * Adds a new value to the heap. This reorders the heap so that the max-heap
     * or min-heap property still holds. Performance: O(log n).
     */
    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }
    
    /**
     * Adds a sequence of values to the heap. This reorders the heap so that
     * the max-heap or min-heap property still holds. Performance: O(log n).
     */
    public mutating func insert<S: Sequence>(_ sequence: S) where S.Iterator.Element == T {
        for value in sequence {
            insert(value)
        }
    }
    
    /**
     * Allows you to change an element. This reorders the heap so that
     * the max-heap or min-heap property still holds.
     */
    public mutating func replace(index i: Int, value: T) {
        guard i < nodes.count else { return }
        
        remove(at: i)
        insert(value)
    }
    
    /**
     * Removes the root node from the heap. For a max-heap, this is the maximum
     * value; for a min-heap it is the minimum value. Performance: O(log n).
     */
    @discardableResult public mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }
        
        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            // Use the last node to replace the first one, then fix the heap by
            // shifting this new first node into its proper position.
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(0)
            return value
        }
    }
    
    /**
     * Removes an arbitrary node from the heap. Performance: O(log n).
     * Note that you need to know the node's index.
     */
    @discardableResult public mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else { return nil }
        
        let size = nodes.count - 1
        if index != size {
            nodes.swapAt(index, size)
            shiftDown(from: index, until: size)
            shiftUp(index)
        }
        return nodes.removeLast()
    }
    
    /**
     * Takes a child node and looks at its parents; if a parent is not larger
     * (max-heap) or not smaller (min-heap) than the child, we exchange them.
     */
    internal mutating func shiftUp(_ index: Int) {
        print("Core Function -> Reorder the heap")
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = self.parentIndex(ofIndex: childIndex)
        
        while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
        
        nodes[childIndex] = child
    }
    
    /**
     * Looks at a parent node and makes sure it is still larger (max-heap) or
     * smaller (min-heap) than its childeren.
     */
    internal mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = leftChildIndex + 1
        
        // Figure out which comes first if we order them by the sort function:
        // the parent, the left child, or the right child. If the parent comes
        // first, we're done. If not, that element is out-of-place and we make
        // it "float down" the tree until the heap property is restored.
        var first = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        if first == index { return }
        
        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }
    
    internal mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.count)
    }
}

// MARK: - Searching
extension Heap where T: Equatable {
    /** Get the index of a node in the heap. Performance: O(n). */
    public func index(of node: T) -> Int? {
        return nodes.index(where: { $0 == node })
    }
    
    /** Removes the first occurrence of a node from the heap. Performance: O(n log n). */
    @discardableResult public mutating func remove(node: T) -> T? {
        if let index = index(of: node) {
            return remove(at: index)
        }
        return nil
    }
}

let heap = Heap(array: [ 10, 7, 2, 5, 1, 16 ], sort: >)
heap.nodes

/*
 Priority Queue, a queue where the most "important" items are at the front of
 the queue.
 The heap is a natural data structure for a priority queue, so this object
 simply wraps the Heap struct.
 All operations are O(lg n).
 Just like a heap can be a max-heap or min-heap, the queue can be a max-priority
 queue (largest element first) or a min-priority queue (smallest element first).
 */

public struct ProrityQueue<T> {
    fileprivate var heap: Heap<T>
    
    /*
     To create a max-priority queue, supply a > sort function. For a min-priority
     queue, use <.
     */
    public init(sort: @escaping (T, T) -> Bool) {
        heap = Heap(sort: sort)
    }
    
    public var isEmpty: Bool {
        return heap.isEmpty
    }
    
    public var count: Int {
        return heap.count
    }
    
    public func peek() -> T? {
        return heap.peek()
    }
    
    public mutating func enqueue(_ element: T) {
        heap.insert(element)
    }
    
    public mutating func dequeue() -> T? {
        return heap.remove()
    }
    
    /*
     Allows you to change the priority of an element. In a max-priority queue,
     the new priority should be larger than the old one; in a min-priority queue
     it should be smaller.
     */
    public mutating func changePrority(index i: Int, value: T) {
        return heap.replace(index: i, value: value)
    }
}

extension ProrityQueue where T: Equatable {
    public func index(of element: T) -> Int? {
        return heap.index(of: element)
    }
}

/*
 Prority Queue can also be implemented by an ordered array.
 An ordered array. When you add a new item to this array, it is inserted in
 sorted position.
 */
public struct OrderedArray<T: Comparable> {
    private var array = [T]()
    
    public init(array: [T]) {
        self.array = array
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public subscript(index: Int) -> T {
        return array[index]
    }
    
    public mutating func removeAtIndex(index: Int) -> T {
        return array.remove(at: index)
    }
    
    public mutating func removeAll() {
        array.removeAll()
    }
    
    public mutating func insert(_ newElement: T) -> Int {
        let i = findInsertionPoint(newElement)
        array.insert(newElement, at: i)
        return i
    }
    
    // Fast version that uses a binary search to look at every element in the array.
    public func findInsertionPoint(_ newElement: T) -> Int {
        var startIndex = 0
        var endIndex = array.count
        
        while startIndex < endIndex {
            let midIndex = startIndex + (endIndex - startIndex) / 2
            if array[midIndex] == newElement {
                return midIndex
            } else if array[midIndex] < newElement {
                startIndex = midIndex + 1
            } else {
                endIndex = midIndex
            }
        }
        return startIndex
    }
}

extension OrderedArray: CustomStringConvertible {
    public var description: String {
        return array.description
    }
}

var a = OrderedArray<Int>(array: [5, 1, 3, 9, 7, -1])
a              // [-1, 1, 3, 5, 7, 9]
a.insert(4)    // inserted at index 3
a              // [-1, 1, 3, 4, 5, 7, 9]
a.insert(-2)   // inserted at index 0
a.insert(10)   // inserted at index 8
a              // [-2, -1, 1, 3, 4, 5, 7, 9, 10]

//: # QuadTree
// A quadtree is a tree in which each internal (not leaf) node has four children.
public struct Point {
    let x: Double
    let y: Double
    
    public init(_ x: Double, _ y: Double) {
        self.x = x
        self.y = y
    }
}

extension Point: CustomStringConvertible {
    public var description: String {
        return "Point(\(x), \(y))"
    }
}

public struct Size: CustomStringConvertible {
    var xLength: Double
    var yLength: Double
    
    public init(xLength: Double, yLength: Double) {
        precondition(xLength >= 0, "xLength can not be negative")
        precondition(yLength >= 0, "yLength can not be negative")
        self.xLength = xLength
        self.yLength = yLength
    }
    
    var half: Size {
        return Size(xLength: xLength / 2, yLength: yLength / 2)
    }
    
    public var description: String {
        return "Size(\(xLength), \(yLength))"
    }
}

public struct Rect {
    // left top vertice
    var origin: Point
    var size: Size
    
    public init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    var minX: Double {
        return origin.x
    }
    
    var minY: Double {
        return origin.y
    }
    
    var maxX: Double {
        return origin.x + size.xLength
    }
    
    var maxY: Double {
        return origin.y + size.yLength
    }
    
    func containts(point: Point) -> Bool {
        return (minX <= point.x && point.x <= maxX) &&
            (minY <= point.y && point.y <= maxY)
    }
    
    var leftTopRect: Rect {
        return Rect(origin: origin, size: size.half)
    }
    
    var leftBottomRect: Rect {
        return Rect(origin: Point(origin.x, origin.y + size.half.yLength), size: size.half)
    }
    
    var rightTopRect: Rect {
        return Rect(origin: Point(origin.x + size.half.xLength, origin.y), size: size.half)
    }
    
    var rightBottomRect: Rect {
        return Rect(origin: Point(origin.x + size.half.xLength, origin.y + size.half.yLength), size: size.half)
    }
    
    func intersects(rect: Rect) -> Bool {
        
        func lineSegmentsIntersect(lStart: Double, lEnd: Double, rStart: Double, rEnd: Double) -> Bool {
            return max(lStart, rStart) <= min(lEnd, rEnd)
        }
        // to intersect, both horizontal and vertical projections need to intersect
        // horizontal
        if !lineSegmentsIntersect(lStart: minX, lEnd: maxX, rStart: rect.minX, rEnd: rect.maxX) {
            return false
        }
        
        // vertical
        return lineSegmentsIntersect(lStart: minY, lEnd: maxY, rStart: rect.minY, rEnd: rect.maxY)
    }
}

extension Rect: CustomStringConvertible {
    public var description: String {
        return "Rect(\(origin), \(size))"
    }
}

protocol PointsContainer {
    func add(point: Point) -> Bool
    func points(inRect rect: Rect) -> [Point]
}

class QuadTreeNode {
    
    enum NodeType {
        case leaf
        case `internal`(children: Children)
    }
    
    struct Children: Sequence {
        let leftTop: QuadTreeNode
        let leftBottom: QuadTreeNode
        let rightTop: QuadTreeNode
        let rightBottom: QuadTreeNode
        
        init(parentNode: QuadTreeNode) {
            leftTop = QuadTreeNode(rect: parentNode.rect.leftTopRect)
            leftBottom = QuadTreeNode(rect: parentNode.rect.leftBottomRect)
            rightTop = QuadTreeNode(rect: parentNode.rect.rightTopRect)
            rightBottom = QuadTreeNode(rect: parentNode.rect.rightBottomRect)
        }
        
        struct ChildrenIterator: IteratorProtocol {
            private var index = 0
            private let children: Children
            
            init(children: Children) {
                self.children = children
            }
            
            mutating func next() -> QuadTreeNode? {
                
                defer { index += 1 }
                
                switch index {
                case 0: return children.leftTop
                case 1: return children.leftBottom
                case 2: return children.rightTop
                case 3: return children.rightBottom
                default: return nil
                }
            }
        }
        
        public func makeIterator() -> ChildrenIterator {
            return ChildrenIterator(children: self)
        }
    }
    
    var points: [Point] = []
    let rect: Rect
    var type: NodeType = .leaf
    
    static let maxPointCapacity = 3
    
    init(rect: Rect) {
        self.rect = rect
    }
    
    var recursiveDescription: String {
        return recursiveDescription(withTabCount: 0)
    }
    
    private func recursiveDescription(withTabCount count: Int) -> String {
        let indent = String(repeating: "\t", count: count)
        var result = "\(indent)" + description + "\n"
        switch type {
        case .internal(let children):
            for child in children {
                result += child.recursiveDescription(withTabCount: count + 1)
            }
        default:
            break
        }
        return result
    }
}

extension QuadTreeNode: PointsContainer {
    
    @discardableResult
    func add(point: Point) -> Bool {
        if !rect.containts(point: point) {
            return false
        }
        
        switch type {
        case .internal(let children):
            // pass the point to one of the children
            for child in children {
                if child.add(point: point) {
                    return true
                }
            }
            
            fatalError("rect.containts evaluted to true, but none of the children added the point")
        case .leaf:
            points.append(point)
            // if the max capacity was reached, become an internal node
            if points.count == QuadTreeNode.maxPointCapacity {
                subdivide()
            }
        }
        return true
    }
    
    private func subdivide() {
        switch type {
        case .leaf:
            type = .internal(children: Children(parentNode: self))
        case .internal:
            preconditionFailure("Calling subdivide on an internal node")
        }
    }
    
    func points(inRect rect: Rect) -> [Point] {
        
        // if the node's rect and the given rect don't intersect, return an empty array,
        // because there can't be any points that lie the node's (or its children's) rect and
        // in the given rect
        if !self.rect.intersects(rect: rect) {
            return []
        }
        
        var result: [Point] = []
        
        // collect the node's points that lie in the rect
        for point in points {
            if rect.containts(point: point) {
                result.append(point)
            }
        }
        
        switch type {
        case .leaf:
            break
        case .internal(let children):
            // recursively add children's points that lie in the rect
            for childNode in children {
                result.append(contentsOf: childNode.points(inRect: rect))
            }
        }
        
        return result
    }
}

extension QuadTreeNode: CustomStringConvertible {
    var description: String {
        switch type {
        case .leaf:
            return "leaf \(rect) Points: \(points)"
        case .internal:
            return "parent \(rect) Points: \(points)"
        }
    }
}

public class QuadTree: PointsContainer {
    
    let root: QuadTreeNode
    
    public init(rect: Rect) {
        self.root = QuadTreeNode(rect: rect)
    }
    
    @discardableResult
    public func add(point: Point) -> Bool {
        return root.add(point: point)
    }
    
    public func points(inRect rect: Rect) -> [Point] {
        return root.points(inRect: rect)
    }
}

extension QuadTree: CustomStringConvertible {
    public var description: String {
        return "Quad tree\n" + root.recursiveDescription
    }
}

//: # B-Tree

/*
class BTreeNode<Key: Comparable, Value> {
    /**
     * The tree that owns the node.
     */
    unowned var owner: BTree<Key, Value>
    
    fileprivate var keys = [Key]()
    fileprivate var values = [Value]()
    var children: [BTreeNode]?
    
    var isLeaf: Bool {
        return children == nil
    }
    
    var numberOfKeys: Int {
        return keys.count
    }
    
    init(owner: BTree<Key, Value>) {
        self.owner = owner
    }
    
    convenience init(owner: BTree<Key, Value>, keys: [Key], values: [Value], children: [BTreeNode]? = nil) {
        self.init(owner: owner)
        self.keys += keys
        self.values += values
        self.children = children
    }
}

extension BTreeNode {
    /**
     *  Returns the value for a given `key`, returns nil if the `key` is not found.
     *
     *  - Parameters:
     *    - key: the key of the value to be returned
     */
    func value(for key: Key) -> Value? {
        var index = keys.startIndex
        
        while (index + 1) < keys.endIndex && keys[index] < key {
            index = (index + 1)
        }
        
        if key == keys[index] {
            return values[index]
        } else if key < keys[index] {
            return children?[index].value(for: key)
        } else {
            return children?[index + 1].value(for: key)
        }
    }
}

extension BTreeNode {
    /**
     *  Traverses the keys in order, executes `process` for every key.
     *
     *  - Parameters:
     *    - process: the closure to be executed for every key
     */
    func traverseInOrder(_ procerss: (Key) -> Void) {
        for i in 0..<numberOfKeys {
            children?[i].traverseInOrder(procerss)
            procerss(keys[i])
        }
        children?.last?.traverseInOrder(procerss)
    }
}

extension BTreeNode {
    
    /**
     *  Inserts `value` for `key` to the node, or to one if its descendants.
     *
     *  - Parameters:
     *    - value: the value to be inserted for `key`
     *    - key: the key for the `value`
     */
    func insert(_ value: Value, for key: Key) {
        var index = keys.startIndex
        
        while index < keys.endIndex && keys[index] < key {
            index += 1
        }
        
        if index < keys.endIndex && keys[index] == key {
            values[index] = value
            return
        }
        
        if isLeaf {
            keys.insert(key, at: index)
            values.insert(value, at: index)
            owner.numberOfKeys += 1
        } else {
            children![index].insert(value, for: key)
            if children![index].numberOfKeys > owner.order * 2 {
                // TODO: - <#todo#>
            }
        }
    }
}

public class BTree<Key: Comparable, Value> {
    
}

 */
