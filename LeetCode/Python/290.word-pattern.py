#
# @lc app=leetcode id=290 lang=python
#
# [290] Word Pattern
#
class Solution(object):
    def wordPattern(self, pattern, str):
        """
        :type pattern: str
        :type str: str
        :rtype: bool
        """
        A = list(pattern)
        B = str.split(' ')
        if len(A) != len(B):
            return False
        dict = {}
        for i in range(len(A)):
            if not dict.get(A[i]):
                dict[A[i]] = B[i]
            elif dict[A[i]] != B[i]:
                return False
        # "abba" "dog dog dog dog" -> false
        if len(dict.keys()) != len(set(dict.values())):
            return False
        return True

