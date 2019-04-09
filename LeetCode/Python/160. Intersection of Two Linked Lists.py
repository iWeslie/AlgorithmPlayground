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
        lenA = lenB = 0
        p1, p2 = headA, headB
        while p1:
            lenA += 1
            p1 = p1.next
        while p2:
            lenB += 1
            p2 = p2.next
        dist = abs(lenA - lenB)  # distance of |headA - headB|
        p1, p2 = headA, headB
        if lenA > lenB:  # move to the aligned node
            while dist > 0:
                dist -= 1
                p1 = p1.next
        else:
            while dist > 0:
                dist -= 1
                p2 = p2.next
        while p1 and p2:  # move to intersection node
            if p1 == p2:
                return p1
            p1 = p1.next
            p2 = p2.next
        return None

    def getIntersectionNode(self, headA, headB):
        """
        :type head1, head1: ListNode
        :rtype: ListNode
        """
        p1, p2 = headA, headB
        if not p1 or not p2: return None
        while p1 != p2:  # O(M + N)
            p1 = p1.next if p1 else headB
            p2 = p2.next if p2 else headA
        return p1
