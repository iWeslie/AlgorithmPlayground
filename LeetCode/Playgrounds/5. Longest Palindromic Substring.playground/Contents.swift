class Solution {
    func expandAroundCenter(s: String, left: Int, right: Int) -> Int {
        var l = left
        var r = right
        let charArray = Array(s)
        while l > 0 && r < s.count && charArray[l] == charArray[r] {
            l -= 1
            r += 1
        }
        return r - l - 1
    }
    
    func longestPalindrome(_ s: String) -> String {
        if s == "" { return "" }
        
        var start = 0
        var end = 0
        
        for i in 0..<s.count {
            let len1 = expandAroundCenter(s: s, left: i, right: i)
            let len2 = expandAroundCenter(s: s, left: i, right: i + 1)
            let len = max(len1, len2)
            print(len)
            
            if len > end - start {
                start = i - (len - 1) / 2
                end = i + len / 2
            }
        }
        return String(Array(s)[start...end])
    }
}


let solution = Solution()
solution.longestPalindrome("cbba")
solution.longestPalindrome("babad")
//babadcefecdgh
