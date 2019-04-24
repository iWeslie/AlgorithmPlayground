#
# @lc app=leetcode id=19 lang=python
#
# [19] Remove Nth Node From End of List
#
# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution(object):
    # One pass Two Pointer
    # O(L), O(1)
    def removeNthFromEnd(self, head, n):
        """
        :type head: ListNode
        :type n: int
        :rtype: ListNode
        """
        dummy = ListNode(0)
        dummy.next = head
        p1 = p2 = dummy
        for _ in range(n+1):
            p2 = p2.next
        while p2:
            p1 = p1.next
            p2 = p2.next
        p1.next = p1.next.next
        return dummy.next

