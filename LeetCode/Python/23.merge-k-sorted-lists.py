#
# @lc app=leetcode id=23 lang=python
#
# [23] Merge k Sorted Lists
#
# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution(object):
    def mergeKLists(self, lists):
        """
        :type lists: List[ListNode]
        :rtype: ListNode
        """
        def mergeTwoList(p1, p2):
            dummy = head = ListNode(0)
            while p1 and p2:
                if p1.val < p2.val:
                    head.next = p1
                    p1 = p1.next
                else:
                    head.next = p2
                    p2 = p2.next
                head = head.next
            if not p1:
                head.next = p2
            else:
                head.next = p1
            return dummy.next

        # divide and conquer
        count = len(lists)
        if count == 0: return
        if count == 1: return lists[0]
        interval = 1
        while interval < count:
            for i in range(0, count-interval, interval*2):
                lists[i] = mergeTwoList(lists[i], lists[i+interval])
            interval *= 2
        return lists[0]

