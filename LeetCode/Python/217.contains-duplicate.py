#
# @lc app=leetcode id=217 lang=python
#
# [217] Contains Duplicate
#
class Solution(object):
    def containsDuplicate(self, nums):
        """
        :type nums: List[int]
        :rtype: bool
        """
        s = sorted(nums)
        for i in range(len(s)-1):
            if s[i] == s[i+1]:
                return True
        return False


