#
# @lc app=leetcode id=22 lang=python
#
# [22] Generate Parentheses
#
class Solution(object):
    def generateParenthesis(self, n):
        """
        :type n: int
        :rtype: List[str]
        """
        res = []
        def backtrack(S = '', left = 0, right = 0):
            if len(S) == 2 * n:
                res.append(S)
            if left < n:
                backtrack(S + '(', left+1, right)
            if right < left:
                backtrack(S + ')', left, right+1)
        backtrack()
        return res

