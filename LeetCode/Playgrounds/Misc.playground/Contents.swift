
class Solution {
    //: 58. Length of Last Word
    func lengthOfLastWord(_ s: String) -> Int {
        let strings = s.split(separator: " ")
        return strings.last?.count ?? 0
    }
    
    //: 67. Add Binary
    func addBinary(_ a: String, _ b: String) -> String {
        let s1 = Array(a)
        let s2 = Array(b)
        
        var i = s1.count - 1
        var j = s2.count - 1
        var carry = 0
        var result = ""
        while i >= 0 || j >= 0 || carry == 1 {
            carry += (i >= 0) ? Int(String(s1[i]))! : 0
            carry += (j >= 0) ? Int(String(s2[j]))! : 0
            result = String(carry % 2) + result
            carry /= 2
            i -= 1
            j -= 1
        }
        
        return result
    }
    
    //: 344. Reverse String
    func reverseString(_ s: inout [Character]) {
        var i = 0
        var j = s.count - 1
        print(s)
        while i <= j {
            s.swapAt(i, j)
            i += 1
            j -= 1
        }
    }
}
var array: [Character] = ["h","e","l","l","o"]
Solution().reverseString(&array)


enum EmptyReturn: Error {
    case EmptyReturnValue
}

class UserMainCode {
    
    func house(input1: Int, input2: Int) -> Int {
        let root = createTree(val: input1, j: input2)
        
        return count
    }
    
    var memo = [Int]()
    var count = 0
    
    func createTree(val: Int, j: Int) -> Node? {
        if val == j || memo.contains(val) {
            if val == j {
                count += 1
            }
            memo.removeLast()
            return nil
        }
        
        memo.append(val)
        let root = Node(val)
        root.left = createTree(val: val + 1, j: j)
        root.right = createTree(val: (val + j / 2) % j, j: j)
        
        return root
        
    }
}


class Node {
    var val: Int
    var left: Node?
    var right: Node?
    
    init(_ val: Int) {
        self.val = val
    }
}
