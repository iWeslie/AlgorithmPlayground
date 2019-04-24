#
# @lc app=leetcode id=69 lang=python
#
# [69] Sqrt(x)
#
class Solution(object):
    def mySqrt(self, x):
        """
        :type x: int
        :rtype: int
        """
        l, r = 0, x
        while l <= r:
            m = l + (r - l) // 2
            if m*m < x:
                if (m+1)*(m+1) > x:
                    return m
                l = m
            elif m*m > x:
                if (m-1)*(m-1) < x:
                    return m
                r = m
            elif m*m == x:
                return m

