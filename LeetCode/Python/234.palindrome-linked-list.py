#
# @lc app=leetcode id=234 lang=python
#
# [234] Palindrome Linked List
#
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def isPalindrome(self, head):
        """
        :type head: ListNode
        :rtype: bool
        """
        rev = None
        slow = fast = head
        while fast and fast.next:
            slow = slow.next
            fast = fast.next.next
        # reverse the second half
        node = None
        while slow:
            next = slow.next
            slow.next = node
            node = slow
            slow = next
        # compare
        l, r = head, node
        while r:
            if l.val != r.val:
                return False
            l, r = l.next, r.next
        return True

