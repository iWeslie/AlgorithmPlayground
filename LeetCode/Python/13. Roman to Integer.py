class Solution(object):
    def romanToInt(self, s):
        """
        :type s: str
        :rtype: int
        """
        d = {'M': 1000, 'D': 500, 'C': 100, 'L': 50, 'X': 10, 'V': 5, 'I': 1}
        result, p = 0, 'I'

        for c in s[::-1]:
            result, p = result - d[c] if d[c] < d[p] else result + d[c], c
        return result
