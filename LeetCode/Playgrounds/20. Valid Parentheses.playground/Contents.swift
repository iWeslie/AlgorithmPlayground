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
        let chars: [Character] = Array(s)
        let dict: [Character: Character] = ["]": "[", "}": "{", ")": "("]
		var stack = [Character]()
		for c in chars {
            if dict.values.contains(c) {
                stack.append(c)
            } else if dict.keys.contains(c) {
                if stack == [] || dict[c] != stack.popLast()! {
                    return false
                }
            } else {
                return false
            }
			
		}
		return stack.count == 0
	}
}

let solution = Solution()
solution.isValid("([)]")
