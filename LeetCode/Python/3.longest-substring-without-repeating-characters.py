#
# @lc app=leetcode id=3 lang=python
#
# [3] Longest Substring Without Repeating Characters
#
class Solution(object):
    def lengthOfLongestSubstring(self, s):
        """
        :type s: str
        :rtype: int
        """
        start = max_len = 0
        dict = {}  # c -> i
        for i, c in enumerate(s):
            if c in dict and start <= dict[c]:  # s[i,j) contains s[j]
                start = dict[c] + 1
            else:  # update max_len
                max_len = max(max_len, i-start+1)
            dict[c] = i  # update i
        return max_len

