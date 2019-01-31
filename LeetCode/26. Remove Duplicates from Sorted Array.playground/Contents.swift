class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count <= 1 {
            return nums.count
        }
        // slow-runner
        var p1 = 0
        // fast-runner
        for p2 in 1..<nums.count {
            if nums[p1] != nums[p2] {
                p1 += 1
                nums[p1] = nums[p2]
            }
        }
        return p1 + 1
    }
}

let solution = Solution()
var test = [0,0,1,1,1,2,2,3,3,4]
solution.removeDuplicates(&test)
