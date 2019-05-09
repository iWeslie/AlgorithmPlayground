#
# @lc app=leetcode id=171 lang=python
#
# [171] Excel Sheet Column Number
#
class Solution(object):
    def titleToNumber(self, s):
        """
        :type s: str
        :rtype: int
        """
        res = 0
        i = len(s) - 1
        n = 0
        while i:
            res += 26 ** n * (ord(s[i])-64)
            i -= 1
            n += 1
        return res

