class Solution(object):
    def intersect(self, nums1, nums2):
        """
        :type nums1: List[int]
        :type nums2: List[int]
        :rtype: List[int]
        """
        counts = {}
        res = []
        for i in nums1:
            counts[i] = counts.get(i, 0) + 1
        for j in nums2:
            if j in counts and counts[j] > 0:
                res.append(j)
                counts[j] -= 1
        return res
