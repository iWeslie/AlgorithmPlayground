#
# @lc app=leetcode id=198 lang=python
#
# [198] House Robber
#
class Solution(object):
    # Recursive (top-down)
    # rob(i) = max(rob(i-2)+cur, rob(i-1))
    # TLE 49/69 test cases passed
    def rob(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        def helper(nums, i):
            if i < 0: return 0
            return max(helper(nums, i-2)+nums[i], helper(nums, i-1))
        return helper(nums, len(nums)-1)

    # Recursive + Memo (top-down)
    # O(n), O(n)
    # TLE 68/69 cases passed
    def rob(self, nums):
        self.memo = {}

        def helper(nums, i):
            if i < 0:
                return 0
            if self.memo.get(i):
                return self.memo[i]
            res = max(helper(nums, i-2)+nums[i], helper(nums, i-1))
            self.memo[i] = res  # TLE when array's elem are same, can not reach
            return res
        return helper(nums, len(nums)-1)

    # DP
    # money[i] = | 0 i=0
    #            | nums[i] i=1
    #            | max(money[i-1], momey[i-2]+nums[i-1]) i>=2
    # O(n), O(n)
    def rob(self, nums):
        if not nums: return 0
        momey = [0] * (len(nums)+1)
        momey[1] = nums[0]
        for i in range(2, len(nums)+1):
            momey[i] = max(momey[i-1], momey[i-2]+nums[i-1])  # DP Core
        return momey[-1]

    # DP Optimized
    # only use dp[i-1] and dp[i-2]
    # O(n), O(1)
    def rob(self, nums):
        if not nums: return 0
        prev1 = prev2 = 0
        for n in nums:
            prev1, prev2 = max(prev2+n, prev1), prev1  # optimization
        return prev1


