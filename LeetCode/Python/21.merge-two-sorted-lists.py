#
# @lc app=leetcode id=21 lang=python
#
# [21] Merge Two Sorted Lists
#
# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution(object):
    # iterative 
    def mergeTwoLists(self, l1, l2):
        """
        :type l1: ListNode
        :type l2: ListNode
        :rtype: ListNode
        """
        dummy = cur = ListNode(0)
        while l1 and l2:
            if l1.val <= l2.val:
                cur.next = l1
                l1 = l1.next
            else:
                cur.next = l2
                l2 = l2.next
            cur = cur.next
        if l1: cur.next = l1
        if l2: cur.next = l2
        return dummy.next
        
    # recursive
    def mergeTwoLists(self, l1, l2):
        if not l1 and not l2: return None
        if not l1 and l2: return l2
        if not l2 and l1: return l1

        if l1.val <= l2.val:
            l1.next = self.mergeTwoLists(l1.next, l2)
            return l1
        else:
            l2.next = self.mergeTwoLists(l1, l2.next)
            return l2

