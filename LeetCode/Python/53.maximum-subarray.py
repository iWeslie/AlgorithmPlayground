#
# @lc app=leetcode id=53 lang=python
#
# [53] Maximum Subarray
#
class Solution(object):
    # DP
    # f(A, i) = A[i] + | f(A, i-1), while f(A, i-1) > 0
    #                  | 0        , otherwise
    # O(n), O(n)
    def maxSubArray(self, nums):
        # dp[i] means the maximum subarray ending with A[i]
        dp, smax = [0] * len(nums), 0
        for i in range(1, len(nums)):
            dp[i] = nums[i] + dp[i-1] if dp[i-1] > 0 else 0
            smax = max(smax, dp[i])
        return smax

    # DP
    # O(n), O(1)
    def maxSubArray(self, nums):
        res = s = nums[0]
        for n in nums[1:len(nums)]:
            if s > 0:
                s += n
            else:
                s = n
            res = max(s, res)
        return res


