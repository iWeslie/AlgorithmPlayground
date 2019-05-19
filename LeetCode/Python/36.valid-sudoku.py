#
# @lc app=leetcode id=36 lang=python
#
# [36] Valid Sudoku
#
class Solution(object):
    def isValidSudoku(self, board):
        """
        :type board: List[List[str]]
        :rtype: bool
        """
        def judgeValid(nums):
            dict = {}
            for s in nums:
                if s in "123456789":
                    n = int(s)
                    if dict.get(n):
                        return False
                    dict[n] = 1
            return True

        # rule 1
        for i in range(9):
            row = board[i]
            if not judgeValid(row):
                return False
        # rule 2
        for i in range(9):
            column = []
            for j in range(9):
                column += [board[j][i]]
            if not judgeValid(column):
                return False
        # rule 3
        for i in (0, 3, 6):
            for j in (0, 3, 6):
                matrix = [board[x][y] for x in range(i, i+3) for y in range(j, j+3)]
                if not judgeValid(matrix):
                    return False

        return True

