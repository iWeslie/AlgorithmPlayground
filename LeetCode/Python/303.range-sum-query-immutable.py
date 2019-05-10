#
# @lc app=leetcode id=303 lang=python
#
# [303] Range Sum Query - Immutable
#
class NumArray(object):

    def __init__(self, nums):
        """
        :type nums: List[int]
        """
        self.accu = [0]
        for n in nums:
            self.accu += self.accu[-1] + n

    def sumRange(self, i, j):
        """
        :type i: int
        :type j: int
        :rtype: int
        """
        return self.accu[j+1] - self.accu[i]


# Your NumArray object will be instantiated and called as such:
# obj = NumArray(nums)
# param_1 = obj.sumRange(i,j)

