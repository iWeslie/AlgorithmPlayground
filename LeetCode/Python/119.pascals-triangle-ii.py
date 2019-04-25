#
# @lc app=leetcode id=119 lang=python
#
# [119] Pascal's Triangle II
#
class Solution(object):
    def getRow(self, rowIndex):
        """
        :type rowIndex: int
        :rtype: List[int]
        """
        i, prev = 1, [1]
        while i <= rowIndex:
            cur = [None] * (i+1)
            cur[0], cur[-1] = 1, 1
            for j in range(1, len(cur)-1):
                cur[j] = prev[j-1] + prev[j]
            i += 1
            prev = cur[:]
        return prev

