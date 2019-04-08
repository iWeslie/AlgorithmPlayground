class Solution(object):
    def fib(self, N):
        """
        :type N: int
        :rtype: int
        """
        cache = {}
        def recur_fib(N):
            if N in cache: return cache[N]
            if N < 2:
                result = N
            else:
                result = recur_fib(N-1) + recur_fib(N-2)

            cache[N] = result
            return result

        return recur_fib(N)
