#
# @lc app=leetcode id=34 lang=python
#
# [34] Find First and Last Position of Element in Sorted Array
#
class Solution(object):
    def boundary(self, nums, target, from_left):
        l, r = 0, len(nums)
        while l < r:
            m = (l + r) // 2
            if nums[m] > target or (from_left and target == nums[m]):
                r = m
            else:
                l = m + 1
        return l

    def searchRange(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        l = self.boundary(nums, target, True)
        if l == len(nums) or nums[l] != target:
            return [-1, -1]
        r = self.boundary(nums, target, False)
        return [l, r-1]


