class Solution {
	func longestCommonPrefix(_ strs: [String]) -> String {
		if strs.count == 0 { return "" }
		if strs.count == 1 { return strs.first! }
		
		let test = strs.first!
		
		var middle = test.count
		
		let left = test.prefix(middle / 2)
		for str in strs[1..<strs.count] {
			str.prefix(middle / 2)
		}
		
		return ""
	}
}


let solution = Solution()
let test = ["flower","flow","flight"]
solution.longestCommonPrefix(test)

