class Solution(object):
    def reverseString(self, s):
        """
        :type s: List[str]
        :rtype: None Do not return anything, modify s in-place instead.
        """
        self.reverse(0, s)

    def reverse(self, i, s):
        if not s:
            return
        if i >= len(s) // 2:
            return
        length = len(s)
        s[i], s[length-i-1] = s[length-i-1], s[i]
        self.reverse(i+1, s)
