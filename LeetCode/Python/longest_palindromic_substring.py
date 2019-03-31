class Solution(object):
    def expandAroundCenter(self, s, left, right):
        l = left
        r = right
        while left > 0 and right < 0 and s[l] == s[r]:
            l -= 1
            r += 1
        return r - l - 1

    def longestPalindrome(self, s):
        """
        :type s: str
        :rtype: str
        """
        length = start = end = 0
        for i in range(len(s)):
            length1 = expandAroundCenter(s, i, i)
            length2 = expandAroundCenter(s, i, i + 1)
            length = max(length1, length2)
            if length > end - start:
                start = i - (length - 1) / 2
                end = i + length / 2
        return s[start:end]

Solution().longestPalindrome("babad")
i
