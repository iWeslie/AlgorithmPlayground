class Solution {
	func longestCommonPrefix(_ strs: [String]) -> String {
		if strs.count == 0 { return "" }
		if strs.count == 1 { return strs.first! }
		
		var minLength = Int.max
		for str in strs {
			minLength = min(minLength, str.count)
		}
		
		var low = 1
		var high = minLength
		
		while low <= high {
			let middle = (low + high) / 2
			if hasCommonPrefix(at: middle, for: strs) {
				low = middle + 1
			} else {
				high = middle - 1
			}
		}
		
		let middle = (low + high) / 2
		if middle == 0 {
			return ""
		}
		return String(strs[0].prefix(middle + 1))
	}
	
	func hasCommonPrefix(at index: Int, for strings: [String]) -> Bool {
		let prefix = strings[0].prefix(index + 1)
		for str in strings {
			if !str.hasPrefix(prefix) {
				return false
			}
		}
		return true
	}
}

let solution = Solution()
let test = ["aa","ab"]
solution.longestCommonPrefix(test)

