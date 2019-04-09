# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution(object):
    def removeElements(self, head, val):
        """
        :type head: ListNode
        :type val: int
        :rtype: ListNode
        """
        dummy = ListNode(0)
        dummy.next = head
        prev = cur = dummy
        while cur:
            prev = cur
            cur = cur.next
            while cur and cur.val == val:
                cur = cur.next
            prev.next = cur
        return dummy.next
