import Foundation

class Solution {
	//: - Complexity: O(n^2)
	func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
		for i in stride(from: 0, to: nums.count, by: 1) {
			for j in stride(from: i + 1, to: nums.count, by: 1) {
				if nums[j] == target - nums[i] {
					return [i, j]
				}
			}
		}
		return [0, 0]
	}
	//: - Complexity: O(n^2)
	func towSum2(_ nums: [Int], _ target: Int) -> [Int] {
		var dict = [Int: Int]()
		
		for i in 0..<nums.count {
			// second number
			let result = target - nums[i]
			if let key = dict[result] {
				return [i, key]
			}
			dict[nums[i]] = i
		}
		return [0]
	}
	
}

let numbers = [2, 7, 11, 15]
let target = 9
let solution = Solution()
solution.twoSum(numbers, target)
