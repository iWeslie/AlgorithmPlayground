#
# @lc app=leetcode id=268 lang=python
#
# [268] Missing Number
#
class Solution(object):
    # sorting
    def missingNumber(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        A = sorted(nums)
        if A[-1] != len(A):
            return len(A)
        elif A[0] != 0:
            return 0

        for i in range(1, len(A)):
            n = A[i-1] + 1
            if A[i] != n:
                return n

    # Hash Set
    def missingNumber(self, nums):
        num_set = set(nums)
        n = len(nums) + 1
        for i in range(n):
            if i not in num_set:
                return i

    # Bit Manipulation
    # 4∧(0∧0)∧(1∧1)∧(2∧3)∧(3∧4)
    #=4∧(0∧0)∧(1∧1)∧(2∧3)∧(3∧4)
    #=0∧0∧0∧0∧2
    #=2
    def missingNumber(self, nums):  
        missing = len(nums)
        for i, n in enumerate(nums):
            missing ^= i ^ n
        return missing

    # Gauss' Formula
    def missingNumber(self, nums):
        expected_sum = len(nums) * (len(nums)+1) // 2
        acutal_sum = sum(nums)
        return expected_sum - acutal_sum

