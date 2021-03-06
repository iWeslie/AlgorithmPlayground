#
# @lc app=leetcode id=20 lang=python
#
# [20] Valid Parentheses
#
class Solution(object):
    def isValid(self, s):
        """
        :type s: str
        :rtype: bool
        """
        stack = []
        dict = {"]": "[", "}": "{", ")": "("}
        for c in s:
            if c in dict.values():
                stack.append(c)
            elif c in dict.keys():
                if stack == [] or dict[c] != stack.pop():
                    return False
            else:
                return False
        return stack == []

