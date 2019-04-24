#
# @lc app=leetcode id=46 lang=python
#
# [46] Permutations
#
class Solution(object):
    def permute(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        return [[n] + p
                for i, n in enumerate(nums)
                for p in self.permute(nums[:i]+nums[i+1:])] or [[]]

