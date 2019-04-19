class Solution(object):
    # list
    # O(n^2), O(n)
    def singleNumber(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        list = []
        for i in nums:
            if i not in list:
                list.append(i)
            else:
                list.remove(i)
        return list.pop()

    # hash table
    # O(n), O(n)
    def singleNumber(self, nums):
        dict = {}
        for i in nums:
            dict[i] = 0 if dict.get(i) else 1
        for k, v in dict.items():
            if v == 1: return k

    # math
    # O(n), O(n)
    # 2*(a+b+c)−(a+a+b+b+c)=c
    def singleNumber(self, nums):
        return 2 * sum(set(nums)) - sum(nums)

    # Bit Manipulation(XOR)
    # O(n), O(1)
    #
    # a ⊕ 0 = a
    # a ⊕ a = 0
    # a ⊕ b ⊕ a = (a ⊕ a) ⊕ b = 0 ⊕ b = b
    def singleNumber(self, nums):
        a = 0
        for i in nums:
            a ^= i
        return a
