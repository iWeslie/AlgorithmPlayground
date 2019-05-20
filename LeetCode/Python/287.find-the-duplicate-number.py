#
# @lc app=leetcode id=287 lang=python
#
# [287] Find the Duplicate Number
#
class Solution(object):
    # Floyd's Tortoise and Hare
    # O(n), O(1)
    def findDuplicate(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        # Find the intersection point of the two runners
        tortoise = hare = nums[0]
        while True:
            tortoise = nums[tortoise]
            hare = nums[nums[hare]]
            if tortoise == hare:
                break
        # Find the "entrance" to the cycle
        p1, p2 = nums[0], tortoise
        while p1 != p2:
            p1 = nums[p1]
            p2 = nums[p2]
        return p1

