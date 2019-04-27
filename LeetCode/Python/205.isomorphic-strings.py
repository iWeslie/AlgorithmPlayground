#
# @lc app=leetcode id=205 lang=python
#
# [205] Isomorphic Strings
#
class Solution(object):
    def isIsomorphic(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        return len(set(s)) == len(set(t)) == len(set(zip(s, t)))

