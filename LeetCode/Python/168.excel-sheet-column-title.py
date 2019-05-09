#
# @lc app=leetcode id=168 lang=python
#
# [168] Excel Sheet Column Title
#
class Solution(object):
    def convertToTitle(self, n):
        """
        :type n: int
        :rtype: str
        """
        res = ""
        while n:
            r = n % 26
            if r == 0:
                r = 26
                n -= 1
            res = chr(64+r) + res
            n //= 26
        return res

