class Solution(object):
    # iterative
    def convertToTitle(self, n):
        """
        :type n: int
        :rtype: str
        """
        res = ""
        while n:
            r = n % 26
            if r == 0:
                r = 26
                n -= 1
            res = chr(64+r) + res
            n //= 26
        return res

    # recursive
    def convertToTitle(self, n):
        return self.convertToTitle((n - 1) / 26) + chr((n - 1) % 26 + ord('A')) if n else "" 
