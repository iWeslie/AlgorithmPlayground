# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution(object):
    def removeNthFromEnd(self, head, n):
        """
        :type head: ListNode
        :type n: int
        :rtype: ListNode
        """
        p = head
        len = 0
        while p:
            p = p.next
            len += 1
        i = len - n
        if i == 0:
            head = head.next
            return head
        prev, cur = head, head
        while i > 0:
            prev = cur
            cur = cur.next
            i -= 1
        prev.next = cur.next
        cur.next = None
        return head

    def removeNthFromEnd(self, head, n):
        """
        :type head: ListNode
        :type n: int
        :rtype: ListNode
        """
        dummy = ListNode(0)
        dummy.next = head
        p1, p2 = dummy, dummy
        for i in range(n+1):
            p2 = p2.next
        while p2:
            p1 = p1.next
            p2 = p2.next
        p1.next = p1.next.next
        return dummy.next
