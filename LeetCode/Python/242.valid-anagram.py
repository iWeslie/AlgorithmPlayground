#
# @lc app=leetcode id=242 lang=python
#
# [242] Valid Anagram
#
class Solution(object):
    def isAnagram(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        return sorted(s) == sorted(t)

