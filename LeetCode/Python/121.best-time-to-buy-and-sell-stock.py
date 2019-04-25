#
# @lc app=leetcode id=121 lang=python
#
# [121] Best Time to Buy and Sell Stock
#
class Solution(object):
    # DP
    def maxProfit(self, prices):
        """
        :type prices: List[int]
        :rtype: int
        """
        min_price = float('inf')
        max_profit = 0
        for p in prices:
            if p < min_price:
                min_price = p
            elif p - min_price > max_profit:
                max_profit = p - min_price
        return max_profit

    # Kadane's Algorithm
    # O(n), O(1)
    def maxProfit(self, prices):
        max_cur = max_so_far = 0
        for i in range(1, len(prices)):
            max_cur = max(0, max_cur+prices[i]-prices[i-1])
            max_so_far = max(max_cur, max_so_far)
        return max_so_far


