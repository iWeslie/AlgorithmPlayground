class Solution(object):
    # binary search
    # O(log(n))
    def findPeakElement(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        l, r = 0, len(nums) - 1
        while l < r:
            m = (l + r) // 2
            if nums[m] > nums[m+1]:
                r = m
            else:
                l = m + 1
        return l

    # linear search
    # O(n)
    def findPeakElement(self, nums):
        for i in range(len(nums)-1):
            if nums[i] > nums[i+1]:
                return i
        return len(nums) - 1


    # recursive binary search
    # O(log(n))
    def findPeakElement(self, nums):
        def search(nums, l, r):
            if l == r:
                return l
            m = (l + r) // 2
            if nums[m] > nums[m+1]:
                return search(nums, l, m)
            return search(nums, m+1, r)

        search(nums, 0, len(nums)-1)
