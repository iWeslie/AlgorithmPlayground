#
# @lc app=leetcode id=118 lang=python
#
# [118] Pascal's Triangle
#
class Solution(object):
    # DP
    # f(i,j) = | 1 (i=0,n-1)
    #          | f(i-1,j-1)+f(i-1,j)
    def generate(self, numRows):
        """
        :type numRows: int
        :rtype: List[List[int]]
        """
        res = []
        for i in range(numRows):
            row = [None for _ in range(i+1)]
            row[0] = row[-1] = 1
            for j in range(1, len(row)-1):
                row[j] = res[i-1][j-1] + res[i-1][j]  # DP Core
            res.append(row)
        return res

