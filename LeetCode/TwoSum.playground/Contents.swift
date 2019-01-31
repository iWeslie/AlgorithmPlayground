import Foundation

class Solution {
	//: - Complexity: O(n^2)
	func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 1..<nums.count {
            for j in 0..<i {
                if nums[j] == target - nums[i] {
                    return [j, i]
                }
            }
        }
        return [0, 0]
	}
	//: - Complexity: O(n)
    /// Approach 2: Two-pass Hash Table
	func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for i in 0..<nums.count {
            dict[nums[i]] = i
        }
        
        for i in 0..<nums.count {
            let result = target - nums[i]
            if let index = dict[result], index != i {
                return [i, index]
            }
        }
        return [0, 0]
	}
    
    //: - Complexity: O(n)
    /// Approach 3: One-pass Hash Table
    func twoSum3(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        
        for i in 0..<nums.count {
            let result = target - nums[i]

            if let index = dict[result] {
                return [index, i]
            }
            dict[nums[i]] = i
        }
        return [0, 0]
    }
}

let numbers = [3,2,4]
let target = 6
let solution = Solution()
solution.twoSum3(numbers, target)
