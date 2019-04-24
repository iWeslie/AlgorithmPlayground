#
# @lc app=leetcode id=50 lang=python
#
# [50] Pow(x, n)
#
class Solution(object):
    def myPow(self, x, n):
        """
        :type x: float
        :type n: int
        :rtype: float
        """
        def helper(x, n):
            if n == 0:
                return 1
            half = helper(x, n // 2)
            if n % 2 == 0:
                return half * half
            else:
                return half * half * x

        if n < 0:
            return 1 / helper(x, -n)
        else:
            return helper(x, n)

