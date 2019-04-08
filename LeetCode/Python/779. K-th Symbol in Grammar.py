class Solution(object):
    def kthGrammar(self, N, K):
        """
        :type N: int
        :type K: int
        :rtype: int
        """
        if N == 0: return 0
        parent = self.kthGrammar(N-1, (K+1)//2)
        if K % 2 == 0:
            return 0 if parent == 1 else 1
        else:
            return parent
