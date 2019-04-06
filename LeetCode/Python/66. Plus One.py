class Solution(object):
    def plusOne(self, digits):
        """
        :type digits: List[int]
        :rtype: List[int]
        """
        n = len(digits) - 1
        carry = 1
        while n >= 0:
            carry = digits[n] + carry
            digits[n] = carry % 10
            if carry >= 10:
                carry = 1
            else:
                carry = 0
            n -= 1
        if carry == 1:
            digits = [1] + digits
        return digits
