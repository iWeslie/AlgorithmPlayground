class Solution(object):
    def trailingZeroes(self, n):
        """
        :type n: int
        :rtype: int
        """
        import math
        power = int(math.log(n, 5))
        res = 0
        while power:
            res += n // (5 ** power)
            power -= 1
        return res

    def trailingZeroes(self, n):
        return 0 if n <= 0 else n/5 + self.trailingZeroes(n/5)
