#
# @lc app=leetcode id=6 lang=python
#
# [6] ZigZag Conversion
#
class Solution(object):
    def convert(self, s, numRows):
        """
        :type s: str
        :type numRows: int
        :rtype: str
        """
        i, j = -1, 0
        if not s: return ""
        if numRows == 1: return s
        unit = len(s) // (2 * numRows - 2) + 1
        row, colomn = numRows, unit * (numRows - 1)
        matrix = [[None] * colomn for _ in range(row)]
        zig = True
        for c in s:
            if zig:
                i += 1
                matrix[i][j] = c
                if i == row-1: zig = False
            else:
                i -= 1
                j += 1
                matrix[i][j] = c
                if i == 1:
                    i = -1
                    j += 1
                    zig = True
                if i == 0:
                    zig = True
        res = ""
        for row in matrix:
            res += ''.join([c for c in row if c])
        return res

