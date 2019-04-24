#
# @lc app=leetcode id=35 lang=python
#
# [35] Search Insert Position
#
class Solution(object):
    def searchInsert(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        l, r = 0, len(nums)
        while l < r:
            m = l + (r - l) // 2
            if target < nums[m]:
                r = m + 1
            elif target > nums[m]:
                l = m
            elif target == nums[m]:
                return m
        return l if target <= nums[l] else r

