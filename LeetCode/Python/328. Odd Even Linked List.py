# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def oddEvenList(self, head):
        """
        :type head: ListNode
        :rtype: ListNode
        """
        if not head or not head.next:
            return head
        i = 1
        prev = cur = head
        while cur.next:
            prev = cur
            cur = cur.next
            i += 1
        lastOdd = cur if i % 2 != 0 else prev
        po = head
        pe = firstEven = head.next
        while po != lastOdd:
            po.next = pe.next
            po = po.next
            pe.next = po.next
            pe = pe.next
        lastOdd.next = firstEven  # point back
        return head
