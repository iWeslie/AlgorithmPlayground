#
# @lc app=leetcode id=14 lang=python
#
# [14] Longest Common Prefix
#
class Solution(object):
    # Horizontal scanning
    def longestCommonPrefix(self, strs):
        """
        :type strs: List[str]
        :rtype: str
        """
        if not strs: return ""
        shortest = min(strs, key=len)  # find shortest str in array
        for i, char in enumerate(shortest):
            for others in strs:
                if others[i] != char:
                    return shortest[:i]
        return shortest


