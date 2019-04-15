class Solution(object):
    def nextGreatestLetter(self, letters, target):
        """
        :type letters: List[str]
        :type target: str
        :rtype: str
        """
        l, r = 0, len(letters)
        while l < r:
            m = l + (r - l) // 2
            if letters[m] <= target:
                l = m + 1
            else:
                r = m
        return letters[l % len(letters)]

print(Solution().nextGreatestLetter(["c", "f", "j"], "a"))
