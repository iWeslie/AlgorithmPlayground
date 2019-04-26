class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let chars = Array(s)
        var dict = [Character: Int]()
        var count = 0
        for i in 0..<chars.count {
            for j in i..<chars.count {
                let c = chars[j]
                if let val = dict[c], val == 1 {
                    break
                } else {
                    dict[c] = 1
                    count += 1
                }
                
            }
        }
        return 0
    }
}

let solution = Solution()
let testStr = "abcabcbb"
solution.lengthOfLongestSubstring(testStr)
