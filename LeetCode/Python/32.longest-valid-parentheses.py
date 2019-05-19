#
# @lc app=leetcode id=32 lang=python
#
# [32] Longest Valid Parentheses
#
class Solution(object):
    # Stack
    # O(n), O(n)
    def longestValidParentheses(self, s):
        """
        :type s: str
        :rtype: int
        """
        res, stack = 0, [-1]
        for i in range(len(s)):
            if s[i] == '(':
                stack.append(i)
            else:
                stack.pop()
                if not stack:
                    stack.append(i)
                else:
                    res = max(res, i - stack[-1])
        return res

    # Dynamic Programming
    # O(n), O(n)
    # .......()
    # s[i]=')' and s[i-1]='('
    # -->  dp[i] = dp[i-2]+2
    # .......))
    # s[i]=')' and s[i-1]=''
    # if s[i-dp[i-1]-1]='(' then dp[i]=dp[i-1]+dp[i-dp[i-1]-2]+2
    def longestValidParentheses(self, s):
        res, dp = 0, [0]*len(s)
        for i in range(1, len(s)):
            if s[i] == ')':
                if s[i-1] == '(':
                    dp[i] = (dp[i-2] if i>=2 else 0) + 2
                elif i-dp[i-1]>0 and s[i-dp[i-1]-1] == '(':
                    dp[i] = dp[i-1] + (dp[i-dp[i-1]-2] if i-dp[i-1]>=2 else 0) + 2
                res = max(res, dp[i])
        return res

