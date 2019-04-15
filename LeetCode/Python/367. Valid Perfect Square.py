class Solution(object):
    def isPerfectSquare(self, num):
        """
        :type num: int
        :rtype: bool
        """
        if num < 0: return False
        if num == 0 or num == 1: return True

        l, r = 1, num // 2 + 1
        while l < r:
            m = (l + r) // 2
            if m * m > num:
                r = m
            elif m * m < num:
                l = m + 1
            elif m * m == num:
                return True
        return False
