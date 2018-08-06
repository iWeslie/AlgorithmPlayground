//: Playground - noun: a place where people can play

//: # Binary Tree

// last checked with Xcode 10.0
#if swift(>=4.0)
print("Hello, Swift 4!")
#endif

/*
 Last-in first-out stack (LIFO)
 Push and pop are O(1) operations.
 */
public struct Stack<Element> {
    fileprivate var array = [Element]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: Element) {
        array.append(element)
    }
    
    public mutating func pop() -> Element? {
        return array.popLast()
    }
    
    public var top: Element? {
        return array.last
    }
}

public class BinaryTree<T> {
    
    fileprivate(set) public var value: T
    fileprivate(set) public var parent: BinaryTree?
    fileprivate(set) public var left: BinaryTree?
    fileprivate(set) public var right: BinaryTree?
    
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
    
    /* How many nodes are in this subtree. Performance: O(n). */
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
}

// MARK: - Init with a generalized table
extension BinaryTree {
    /*
     * Generalized Example: a(b(d),c(f(,e),g))
     * Binary Tree:
     *        a
     *       / \
     *      b  c
     *     /  / \
     *    d  f  g
     *        \
     *         e
     */
    /// "+(*(5,(-(a,8))),*(-(,4),/(3,b)))"
    convenience init(string: String) {
        // TODO: - <#validate#>
        let charArray = Array(string)
        var addLeftChild = true
        self.init(value: charArray.first! as! T)
        var currentNode = self
        var stack = Stack<BinaryTree?>()
        stack.push(self)
        for char in charArray.dropFirst() {
            switch char {
            case " ": break
            case "(":
                stack.push(currentNode)
                addLeftChild = true
            case ")":
                guard !stack.isEmpty else {
                    fatalError("generalized table invalid")
                }
                stack.pop()
            case ",":
                addLeftChild = false
            default:
                currentNode = BinaryTree(value: char as! T)
                if let peek = stack.top {
                    if addLeftChild {
                        peek?.left = currentNode
                    } else {
                        peek?.right = currentNode
                    }
                }
            }
        }
        
    }
}

// MARK: - Traversal
extension BinaryTree {
    public func traversePreOrder(procerss: (T) -> Void) {
        procerss(value)
        left?.traversePreOrder(procerss: procerss)
        right?.traversePreOrder(procerss: procerss)
    }
    public func traverseInOrder(procerss: (T) -> Void) {
        left?.traverseInOrder(procerss: procerss)
        procerss(value)
        right?.traverseInOrder(procerss: procerss)
    }
    public func traversePostOrder(procerss: (T) -> Void) {
        left?.traversePostOrder(procerss: procerss)
        right?.traversePostOrder(procerss: procerss)
        procerss(value)
    }
}

// MARK: - Debugging
extension BinaryTree: CustomStringConvertible {
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



let tree = BinaryTree<Any>(string: "+(*(5,(-(a,8))),*(-(,4),/(3,b)))")
tree.description

tree.traversePreOrder { s in print(s, separator: " ", terminator: "") }
print("\n")
tree.traverseInOrder { s in print(s, separator: " ", terminator: "") }
print("\n")
tree.traversePostOrder { s in print(s, separator: " ", terminator: "") }


print("\n")
let pol = BinaryTree(value: "+")

let node2 = BinaryTree(value: "*")
let node3 = BinaryTree(value: "*")
let node4 = BinaryTree(value: "5")
let node5 = BinaryTree(value: "-")
let node6 = BinaryTree(value: "-")
let node7 = BinaryTree(value: "/")
let node8 = BinaryTree(value: "a")
let node9 = BinaryTree(value: "8")
let node10 = BinaryTree(value: "4")
let node11 = BinaryTree(value: "3")
let node12 = BinaryTree(value: "b")

pol.left = node2
pol.right = node3
node2.left = node4
node2.right = node5
node3.left = node6
node3.right = node7
node5.left = node8
node5.right = node9
node6.right = node10
node7.left = node11
node7.right = node12

pol.description

pol.traversePreOrder { s in print(s, separator: " ", terminator: "") }
print("\n")
pol.traverseInOrder { s in print(s, separator: " ", terminator: "") }
print("\n")
pol.traversePostOrder { s in print(s, separator: " ", terminator: "") }
