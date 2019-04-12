# The guess API is already defined for you.
# @param num, your guess
# @return -1 if my number is lower, 1 if my number is higher, otherwise return 0
def guess(num):
    pass

class Solution(object):
    def guessNumber(self, n):
        """
        :type n: int
        :rtype: int
        """
        l, r = 1, n
        while l <= r:
            m = (l + r) // 2
            if guess(m) == 1:
                l = m+1
            elif guess(m) == -1:
                r = m-1
            elif guess(m) == 0:
                return m
        return -1
