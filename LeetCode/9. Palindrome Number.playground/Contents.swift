class Solution {
	func isPalindrome(_ x: Int) -> Bool {
		if x < 0 || (x % 10 == 0 && x != 0) {
			return false
		}
		
		var y = x
		var reversed = 0
		while y > reversed {
			reversed = reversed * 10 + y % 10
			y /= 10
		}
		
		return y == reversed || y == reversed / 10
	}
}

let solution = Solution()
let test = 1234565421
solution.isPalindrome(test)
