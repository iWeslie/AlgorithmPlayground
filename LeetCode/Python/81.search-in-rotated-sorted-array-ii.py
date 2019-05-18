#
# @lc app=leetcode id=81 lang=python
#
# [81] Search in Rotated Sorted Array II
#
class Solution(object):
    def search(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: bool
        """
        l, r = 0, len(nums)-1
        while l <= r:
            m = l + (r - l) // 2
            if nums[m] == target:
                return True
            while l < m and nums[l] == nums[m]:  # tricky
                l += 1
            # left half is ordered
            if nums[l] <= nums[m]:
                if nums[l] <= target < nums[m]:
                    r = m - 1
                else:
                    l = m + 1
            else:
                if nums[m] < target <= nums[r]:
                    l = m + 1
                else:
                    r = m - 1
        return False

