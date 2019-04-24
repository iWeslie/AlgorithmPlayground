#
# @lc app=leetcode id=28 lang=python
#
# [28] Implement strStr()
#
class Solution(object):
    def strStr(self, haystack, needle):
        """
        :type haystack: str
        :type needle: str
        :rtype: int
        """
        size = len(haystack) - len(needle)
        if size < 0: return -1

        for i in range(size+1):
            for j in range(len(needle)):
                if haystack[i+j] != needle[j]:
                    break
                if j == len(needle) - 1:
                    return i
        return -1


