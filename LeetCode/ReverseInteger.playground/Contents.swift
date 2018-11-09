import Foundation

class Solution {
	func reverse(_ x: Int) -> Int {
		var y = x
		var reversed = 0
		while y != 0 {
			reversed = 10 * reversed + y % 10
			y /= 10
		}
		if reversed > Int.max || reversed < Int.min {
			return 0
		} else {
			return reversed
		}
	}
}

let solution = Solution()
solution.reverse(1234567890)
