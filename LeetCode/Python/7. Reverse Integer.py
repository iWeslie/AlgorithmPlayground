class Solution(object):
    def reverse(self, x):
        """
        :type x: int
        :rtype: int
        """
        (sign, x) = (1, x) if x >= 0 else (-1, abs(x))
        reversed = 0
        while x:
            reversed = 10 * reversed + x % 10
            x /= 10
        reversed *= sign
        if -2**31 <= reversed <= 2**31 - 1:
            return reversed
        else:
            return 0


solution = Solution()
solution.reverse(-123)
