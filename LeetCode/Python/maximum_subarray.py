class Solution(object):
    def maxSubArray(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        n = len(nums)
        res = s = nums[0]

        for i in range(1, n):
            if s > 0:
                s += nums[i]
            else:
                s = nums[i]
            res = max(s, res)
        return res
