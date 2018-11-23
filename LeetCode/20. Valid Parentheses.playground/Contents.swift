//Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
//
//An input string is valid if:
//
//Open brackets must be closed by the same type of brackets.
//Open brackets must be closed in the correct order.
//Example 1:
//
//Input: "()"
//Output: true
//Example 2:
//
//Input: "()[]{}"
//Output: true
//Example 3:
//
//Input: "(]"
//Output: false
//Example 4:
//
//Input: "([)]"
//Output: false
//Example 5:
//
//Input: "{[]}"
//Output: true

class Solution {
	func isValid(_ s: String) -> Bool {
		let chars = s.map { $0 }
		var stack = [Character]()
		for c in chars {
			if c == "(" || c == "[" || c == "{" {
				stack.append(c)
				continue
			}
			switch c {
			case ")":
				if stack.last != "(" {
					return false
				} else {
					stack.removeLast()
				}
			case "]":
				if stack.last != "[" {
					return false
				} else {
					stack.removeLast()
				}
			case "}":
				if stack.last != "{" {
					return false
				} else {
					stack.removeLast()
				}
			default: return false
			}
			
		}
		if stack.count != 0 {
			return false
		} else {
			return true
		}
	}
}

let solution = Solution()
solution.isValid("([)]")
