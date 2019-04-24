#
# @lc app=leetcode id=1 lang=python
#
# [1] Two Sum
#
class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        dict = {}
        for i in range(len(nums)):
            res = target - nums[i]
            if res not in dict:
                dict[nums[i]] = i  # save index
            else:
                return [dict[res], i]  
        return [0, 0]

