#
# @lc app=leetcode id=25 lang=python
#
# [25] Reverse Nodes in k-Group
#
# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution(object):
    def reverseKGroup(self, head, k):
        """
        :type head: ListNode
        :type k: int
        :rtype: ListNode
        """
        if not head or not head.next or k == 1:
            return head
        dummy = ListNode(0)
        dummy.next = head
        begin = dummy
        i = 0
        while head:
            i += 1
            if i % k == 0:
                begin = self.reverse(begin, head.next)
                head = begin.next
            else:
                head = head.next
        return dummy.next

    # 0->1->2->3->4->5->6
    # |           |
    # begin       end
    #
    # 0->3->2->1->4->5->6
    #          |  |
    #      begin end
    def reverse(self, begin, end):
        prev, cur = begin, begin.next
        first, next = cur, cur
        while cur != end:
            next = cur.next
            cur.next = prev
            prev = cur
            cur = next
        begin.next = prev
        first.next = cur
        return first

