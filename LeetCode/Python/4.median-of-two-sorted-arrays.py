#
# @lc app=leetcode id=4 lang=python
#
# [4] Median of Two Sorted Arrays
#
class Solution(object):
    def findMedianSortedArrays(self, nums1, nums2):
        """
        :type nums1: List[int]
        :type nums2: List[int]
        :rtype: float
        """
        arr = []
        i = j = 0
        m, n = len(nums1), len(nums2)
        while i < m and j < n:
            if nums1[i] < nums2[j]:
                arr.append(nums1[i])
                i += 1
            else:
                arr.append(nums2[j])
                j += 1
        if i < m: arr += nums1[i:]
        if j < n: arr += nums2[j:]
        length = len(arr)
        if length % 2 == 0:
            return float(arr[length//2-1]+arr[length//2])/2
        else:
            return arr[length//2]

