#
# @lc app=leetcode id=240 lang=python
#
# [240] Search a 2D Matrix II
#
class Solution(object):
    def searchMatrix(self, matrix, target):
        """
        :type matrix: List[List[int]]
        :type target: int
        :rtype: bool
        """
        if not matrix or len(matrix) < 1 or len(matrix[0]) < 1:
            return False
        r, c = 0, len(matrix[0]) - 1
        while c >= 0 and r <= len(matrix)-1:
            if matrix[r][c] < target:
                r += 1
            elif matrix[r][c] > target:
                c -= 1
            else:
                return True
        return False

