#
# @lc app=leetcode id=292 lang=python
#
# [292] Nim Game
#
class Solution(object):
    def canWinNim(self, n):
        """
        :type n: int
        :rtype: bool
        """
        return n % 4 != 0

