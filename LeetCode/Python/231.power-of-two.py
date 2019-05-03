#
# @lc app=leetcode id=231 lang=python
#
# [231] Power of Two
#
class Solution(object):
    def isPowerOfTwo(self, n):
        """
        :type n: int
        :rtype: bool
        """
        return n > 0 and n & n-1 == 0
