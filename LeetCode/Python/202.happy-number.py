#
# @lc app=leetcode id=202 lang=python
#
# [202] Happy Number
#
class Solution(object):
    def isHappy(self, n):
        """
        :type n: int
        :rtype: bool
        """
        dict = {}
        def sum_digit_square(n):
            res = 0
            while n != 0:
                digit = n % 10
                res += digit ** 2
                n //= 10
            return res
        while n != 1:
            if dict.get(n):
                return False
            res = sum_digit_square(n)
            dict[n] = 1
            n = res
        return True

