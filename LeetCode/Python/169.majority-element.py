#
# @lc app=leetcode id=169 lang=python
#
# [169] Majority Element
# https://leetcode.com/problems/majority-element/solution/
class Solution(object):
    # Hash Table
    # O(n), O(n)
    def majorityElement(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        dict = {}
        for i in nums:
            dict[i] = dict[i]+1 if dict.get(i) else 1
        times = len(nums) // 2
        for k, v in dict.items():
            if v > times:
                return k

    # Sorting
    # the majority element can be found at ⌊n/2⌋
    # O(nlogn), O(1)
    def majorityElement(self, nums):
        nums.sort()
        return nums[len(nums)//2]

    # Randomization
    # random pick a number in array
    # O(n)(∞), O(1)
    def majorityElement(self, nums):
        count = len(nums) // 2
        while True:
            import random
            candidate = random.choice(nums)
            if sum(1 for elem in nums if elem == candidate) > count:
                return candidate

    # Divide and Conquer
    # O(nlogn), O(logn)
    def majorityElement(self, nums):
        def helper(l, r):
            if l == r:
                return nums[l]
            m = l + (r - l) // 2
            l = helper(l, m)
            r = helper(m+1, r)

            if l == r:
                return l

            l_count = sum(1 for i in range(l, r+1) if nums[i] == l)
            r_count = sum(1 for i in range(l, r+1) if nums[i] == r)

            return l if l_count > r_count else r

        return helper(0, len(nums)-1)

    # Boyer-Moore Voting
    # O(n), O(1)
    def majorityElement(self, nums):
        count = 0
        candidate = None

        for num in nums:
            if count == 0:
                candidate = num
            count += (1 if num == candidate else -1)

        return candidate
    
