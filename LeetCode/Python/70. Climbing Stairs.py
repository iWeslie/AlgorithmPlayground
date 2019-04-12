class Solution(object):
    def climbStairs(self, n):
        """
        :type n: int
        :rtype: int
        """
        cache = {}
        def fib(n):
            if n in cache: return cache[n]
            if n <=3:
                result = n
            else:
                result = fib(n-1) + fib(n-2)

            cache[n] = result
            return result

        return fib(n)
        
