class Solution(object):
    def searchRange(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        n = len(nums)
        l, r = 0, n - 1
        if n == 0:
            return [-1, -1]
        if n == 1:
            return [0, 0] if target == nums[0] else [-1, -1]
        if nums[l] == target:
            a = b = l
            while b<n-1 and nums[b+1] == target:
                b += 1
            return [a, b]
        if nums[r] == target:
            a = b = r
            while a>0 and nums[a-1] == target:
                    a -= 1
            return [a, b]

        while l < r:
            m = (l + r) // 2
            if nums[m] < target:
                l = m + 1
            elif nums[m] > target:
                r = m
            else:
                a = b = m
                while a>0 and nums[a-1] == target:
                    a -= 1
                while b<n-1 and nums[b+1] == target:
                    b += 1
                return [a, b]
        return [-1, -1]
