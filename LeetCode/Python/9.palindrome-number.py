#
# @lc app=leetcode id=9 lang=python
#
# [9] Palindrome Number
#
class Solution(object):
    def isPalindrome(self, x):
        """
        :type x: int
        :rtype: bool
        """
        if x < 0 or (x % 10 == 0 and x != 0):
            return False
        
        reversed = 0
        while x > reversed:
            reversed = reversed * 10 + x % 10
            x //= 10
        return x == reversed or x == reversed // 10

