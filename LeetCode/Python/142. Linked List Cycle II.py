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
        p0 = head
        p1 = head
        p2 = head
        if not head or not head.next: return None
        while p2.next and p2.next.next:
            p1 = p1.next
            p2 = p2.next.next
            if p1 == p2:
                while p1 != p0:
                    p1 = p1.next
                    p0 = p0.next
                return p0
        return None
