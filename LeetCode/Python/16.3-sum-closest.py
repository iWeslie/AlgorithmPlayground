#
# @lc app=leetcode id=16 lang=python
#
# [16] 3Sum Closest
#
class Solution(object):
    def threeSumClosest(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        res = nums[0] + nums[1] + nums[-1]
        nums.sort()
        for i in range(len(nums)-2):
            l, r = i+1, len(nums)-1
            while l < r:
                tmp = nums[i] + nums[l] + nums[r]
                if tmp > target:
                    r -= 1
                else:
                    l += 1
                if abs(tmp - target) < abs(res - target):
                    res = tmp
        return res

