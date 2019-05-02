#
# @lc app=leetcode id=258 lang=python
#
# [258] Add Digits
#
class Solution(object):
    def addDigits(self, num):
        """
        :type num: int
        :rtype: int
        """
        return 0 if num == 0 else (num - 1) % 9 + 1

