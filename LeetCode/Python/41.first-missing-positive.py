#
# @lc app=leetcode id=41 lang=python
#
# [41] First Missing Positive
#
class Solution(object):
    def firstMissingPositive(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        arr = list(range(1, len(nums)+1))
        dict = {}
        for n in nums:
            if n > 0:
                dict[n] = 1
        for i in arr:
            if not dict.get(i):
                return i
        return len(nums)+1

    # put each number in its right place
    def firstMissingPositive(self, A):
        n = len(A)
        for i in range(n):
            while A[i] > 0 and A[i]<=n and A[A[i]-1] != A[i]:
                A[i], A[A[i]-1] = A[A[i]-1], A[i]
        for i in range(n):
            if A[i] != i + 1:
                return i + 1
        return n + 1

