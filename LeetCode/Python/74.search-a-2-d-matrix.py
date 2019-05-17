#
# @lc app=leetcode id=74 lang=python
#
# [74] Search a 2D Matrix
#
class Solution(object):
    def searchMatrix(self, matrix, target):
        """
        :type matrix: List[List[int]]
        :type target: int
        :rtype: bool
        """
        if not matrix or not matrix[0]:
            return False
        r, c = len(matrix), len(matrix[0])
        l, r = 0, r*c-1
        while l != r:
            m = l + (r - l) // 2
            if matrix[m // c][m % c] < target:
                l = m + 1
            else:
                r = m
        return matrix[r / c][r % c] == target
