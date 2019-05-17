#
# @lc app=leetcode id=17 lang=python
#
# [17] Letter Combinations of a Phone Number
#
class Solution(object):
    def letterCombinations(self, digits):
        """
        :type digits: str
        :rtype: List[str]
        """
        dict = {2: "abc", 3: "def", 4: "ghi", 5: "jkl",
                6: "mno", 7: "pqrs", 8: "tuv", 9: "wxyz"}

        if len(digits) == 0:
            return []
        if len(digits) == 1:
            return list(dict[digits[0]])
        prev = self.letterCombinations(digits[:-1])
        last = digits[-1]
        return [s + c for s in prev for c in last]

