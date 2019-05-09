#
# @lc app=leetcode id=172 lang=python
#
# [172] Factorial Trailing Zeroes
#
class Solution(object):
    def trailingZeroes(self, n):
        """
        :type n: int
        :rtype: int
        """
        # 5^2 = 25, 5^3 = 125
        return 0 if n <= 0 else n/5 + self.trailingZeroes(n/5)

