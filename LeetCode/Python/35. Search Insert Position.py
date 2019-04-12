class Solution(object):
    def searchInsert(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        """
        lower = 0
        upper = len(nums)
        while lower < upper:
            middle = lower + (upper - lower) / 2
            if upper - lower == 1:
                break
            if target < nums[middle]:
                upper = middle
            elif target > nums[middle]:
                lower = middle
            elif target == nums[middle]:
                return middle
        if target <= nums[lower]:
            return lower
        else:
            return upper
