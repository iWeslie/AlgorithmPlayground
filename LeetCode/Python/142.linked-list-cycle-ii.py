#
# @lc app=leetcode id=142 lang=python
#
# [142] Linked List Cycle II
#
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def detectCycle(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        p0 = p1 = p2 = head
        if not head or not head.next:
            return None
        while p2.next and p2.next.next:
            p1 = p1.next
            p2 = p2.next.next
            if p1 == p2:
                while p1 != p0:  # core
                    p1 = p1.next
                    p0 = p0.next
                return p0
        return None


# |------------>|------>|
# |     x1      |   x2  |
#                       ^------p1 == p2
#
# |------------>|------>|-->|
#               ^-----------<
#               |     x3    |
#
# slow = x1 + x2
# fast = x1 + x2 + x3 + x2 = 2 * slow
# => x1 = x3


