#
# @lc app=leetcode id=160 lang=python
#
# [160] Intersection of Two Linked Lists
#
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def getIntersectionNode(self, headA, headB):
        """
        :type head1, head1: ListNode
        :rtype: ListNode
        """
        p1, p2 = headA, headB
        if not p1 or not p2:
            return None
        while p1 != p2:  # O(M + N)
            p1 = p1.next if p1 else headB
            p2 = p2.next if p2 else headA
        return p1

        # A: ---------------=======
        # B: ++++=======
        #    ---------------=======++++|=======
        #    ++++=======---------------|=======
        #                              ^---intersection

