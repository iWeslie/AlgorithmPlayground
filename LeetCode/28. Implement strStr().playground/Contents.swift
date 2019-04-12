//Implement strStr().
//
//Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
//
//Example 1:
//
//Input: haystack = "hello", needle = "ll"
//Output: 2
//Example 2:
//
//Input: haystack = "aaaaa", needle = "bba"
//Output: -1
//Clarification:
//
//What should we return when needle is an empty string? This is a great question to ask during an interview.
//
//For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let haystackArray: [Character] = Array(haystack)
        let needleArray: [Character] = Array(needle)
        let size = haystack.count - needle.count
        
        if size < 0 {
            return -1
        }
        var i = 0
        var j = 0
        for _ in 0...size {
            for _ in 0..<needle.count {
                if haystackArray[i + j] != needleArray[j] {
                    j = 0
                    break
                }
                j += 1
            }
            if j == needle.count {
                return i
            }
            i += 1
        }
        return -1
    }
}


let solution = Solution()
let haystack = "hello"
let needle = "ll"
solution.strStr(haystack, needle)

