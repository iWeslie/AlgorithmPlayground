class Solution(object):
    # dp
    # O(n), O(n)
    def rob(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        if not nums: return 0
        if len(nums) <= 2: return max(nums)

        res = [0] * len(nums)
        res[0], res[1] = nums[0], max(nums[0], nums[1])
        for i in range(2, len(nums)):
            res[i] = max(res[i-1], res[i-2]+nums[i])
        return res[-1]

    # dp
    # O(n), O(1)
    def rob(self, nums):
        if not nums: return 0
        if len(nums) <= 2: return max(nums)

        res = [0] * 2  # rolling array
        res[0], res[1] = nums[0], max(nums[0], nums[1])
        for i in range(2, len(nums)):
            res[i % 2] = max(res[(i-1) % 2], res[(i-2) % 2]+nums[i])
        return max(res[0], res[1])
