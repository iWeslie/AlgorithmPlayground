//: Playground - noun: a place where people can play

//: # Binary Tree

// last checked with Xcode 10.0
#if swift(>=4.0)
print("Hello, Swift 4!")
#endif
import Foundation
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
    
    public var depth: Int {
        return max(left?.depth ?? 0, right?.depth ?? 0) + 1
    }
    
    var asString:String { return treeString(self){("\($0.value)",$0.left,$0.right)}  }
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
        let charArray = Array(string)
        self.init(value: charArray.first! as! T)
        
        var currentNode = self
        var addLeftChild = true
        
        var stack = Stack<BinaryTree?>()
        stack.push(currentNode)
        
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

extension BinaryTree where T: Comparable {
    
    public func search(node: BinaryTree, value: T) -> T? {
        if node.value == value {
            return node.value
        }
        var matchedValue: T?
        if let left = node.left {
            matchedValue = search(node: left, value: value)
        }
        if let right = node.right {
            matchedValue = search(node: right, value: value)
        }
        return matchedValue
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

extension BinaryTree {
    
    public func treeString<T>(_ node:T, reversed:Bool=false, isTop:Bool=true, using nodeInfo:(T)->(String,T?,T?)) -> String {
        // node value string and sub nodes
        let (stringValue, leftNode, rightNode) = nodeInfo(node)
        
        let stringValueWidth  = stringValue.count
        
        // recurse to sub nodes to obtain line blocks on left and right
        let leftTextBlock     = leftNode  == nil ? []
            : treeString(leftNode!,reversed:reversed,isTop:false,using:nodeInfo)
                .components(separatedBy:"\n")
        
        let rightTextBlock    = rightNode == nil ? []
            : treeString(rightNode!,reversed:reversed,isTop:false,using:nodeInfo)
                .components(separatedBy:"\n")
        
        // count common and maximum number of sub node lines
        let commonLines       = min(leftTextBlock.count,rightTextBlock.count)
        let subLevelLines     = max(rightTextBlock.count,leftTextBlock.count)
        
        // extend lines on shallower side to get same number of lines on both sides
        let leftSubLines      = leftTextBlock
            + Array(repeating:"", count: subLevelLines-leftTextBlock.count)
        let rightSubLines     = rightTextBlock
            + Array(repeating:"", count: subLevelLines-rightTextBlock.count)
        
        // compute location of value or link bar for all left and right sub nodes
        //   * left node's value ends at line's width
        //   * right node's value starts after initial spaces
        let leftLineWidths    = leftSubLines.map{$0.count}
        let rightLineIndents  = rightSubLines.map{$0.prefix{$0==" "}.count  }
        
        // top line value locations, will be used to determine position of current node & link bars
        let firstLeftWidth    = leftLineWidths.first   ?? 0
        let firstRightIndent  = rightLineIndents.first ?? 0
        
        
        // width of sub node link under node value (i.e. with slashes if any)
        // aims to center link bars under the value if value is wide enough
        //
        // ValueLine:    v     vv    vvvvvv   vvvvv
        // LinkLine:    / \   /  \    /  \     / \
        //
        let linkSpacing       = min(stringValueWidth, 2 - stringValueWidth % 2)
        let leftLinkBar       = leftNode  == nil ? 0 : 1
        let rightLinkBar      = rightNode == nil ? 0 : 1
        let minLinkWidth      = leftLinkBar + linkSpacing + rightLinkBar
        let valueOffset       = (stringValueWidth - linkSpacing) / 2
        
        // find optimal position for right side top node
        //   * must allow room for link bars above and between left and right top nodes
        //   * must not overlap lower level nodes on any given line (allow gap of minSpacing)
        //   * can be offset to the left if lower subNodes of right node
        //     have no overlap with subNodes of left node
        let minSpacing        = 2
        let rightNodePosition = zip(leftLineWidths,rightLineIndents[0..<commonLines])
            .reduce(firstLeftWidth + minLinkWidth)
            { max($0, $1.0 + minSpacing + firstRightIndent - $1.1) }
        
        
        // extend basic link bars (slashes) with underlines to reach left and right
        // top nodes.
        //
        //        vvvvv
        //       __/ \__
        //      L       R
        //
        let linkExtraWidth    = max(0, rightNodePosition - firstLeftWidth - minLinkWidth )
        let rightLinkExtra    = linkExtraWidth / 2
        let leftLinkExtra     = linkExtraWidth - rightLinkExtra
        
        // build value line taking into account left indent and link bar extension (on left side)
        let valueIndent       = max(0, firstLeftWidth + leftLinkExtra + leftLinkBar - valueOffset)
        let valueLine         = String(repeating:" ", count:max(0,valueIndent))
            + stringValue
        let slash             = reversed ? "\\" : "/"
        let backSlash         = reversed ? "/"  : "\\"
        let uLine             = reversed ? "¯"  : "_"
        // build left side of link line
        let leftLink          = leftNode == nil ? ""
            : String(repeating: " ", count:firstLeftWidth)
            + String(repeating: uLine, count:leftLinkExtra)
            + slash
        
        // build right side of link line (includes blank spaces under top node value)
        let rightLinkOffset   = linkSpacing + valueOffset * (1 - leftLinkBar)
        let rightLink         = rightNode == nil ? ""
            : String(repeating:  " ", count:rightLinkOffset)
            + backSlash
            + String(repeating:  uLine, count:rightLinkExtra)
        
        // full link line (will be empty if there are no sub nodes)
        let linkLine          = leftLink + rightLink
        
        // will need to offset left side lines if right side sub nodes extend beyond left margin
        // can happen if left subtree is shorter (in height) than right side subtree
        let leftIndentWidth   = max(0,firstRightIndent - rightNodePosition)
        let leftIndent        = String(repeating:" ", count:leftIndentWidth)
        let indentedLeftLines = leftSubLines.map{ $0.isEmpty ? $0 : (leftIndent + $0) }
        
        // compute distance between left and right sublines based on their value position
        // can be negative if leading spaces need to be removed from right side
        let mergeOffsets      = indentedLeftLines
            .map{$0.count}
            .map{leftIndentWidth + rightNodePosition - firstRightIndent - $0 }
            .enumerated()
            .map{ rightSubLines[$0].isEmpty ? 0  : $1 }
        
        
        // combine left and right lines using computed offsets
        //   * indented left sub lines
        //   * spaces between left and right lines
        //   * right sub line with extra leading blanks removed.
        let mergedSubLines    = zip(mergeOffsets.enumerated(),indentedLeftLines)
            .map{ ( $0.0, $0.1, $1 + String(repeating:" ", count:max(0,$0.1)) ) }
            .map{ $2 + String(rightSubLines[$0].dropFirst(max(0,-$1))) }
        
        // Assemble final result combining
        //  * node value string
        //  * link line (if any)
        //  * merged lines from left and right sub trees (if any)
        let treeLines = [leftIndent + valueLine]
            + (linkLine.isEmpty ? [] : [leftIndent + linkLine])
            + mergedSubLines
        
        return (reversed && isTop ? treeLines.reversed(): treeLines)
            .joined(separator:"\n")
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

pol.asString
