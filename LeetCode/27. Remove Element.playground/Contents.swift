class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        for j in nums {
            if j != val {
                nums[i] = j
                i += 1
            }
        }
        return i
    }
}

var test = [0,1,2,2,3,0,4,2]
Solution().removeElement(&test, 2)
test
