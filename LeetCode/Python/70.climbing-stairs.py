#
# @lc app=leetcode id=70 lang=python
#
# [70] Climbing Stairs
#
class Solution(object):
    # Recursion with Memoization
    # O(n), O(n)
    def climbStairs(self, n):
        """
        :type n: int
        :rtype: int
        """
        memo = {}
        def fib(n):
            if n in memo: return memo[n]
            if n <= 3:
                res = n
            else:
                res = fib(n-1) + fib(n-2)
            memo[n] = res
            return res
        return fib(n)

    # DP
    # f(i) = | i, i<=3
    #        | f(i-1) + f(i-2), i>3
    # O(n), O(n)
    def climbStairs(self, n):
        dp = [0] * (n+1)
        dp[1], dp[2], dp[3] = 1, 2, 3
        for i in range(4, n+1):
            dp[i] = dp[i-1] + dp[i-2]
        return dp[n]

