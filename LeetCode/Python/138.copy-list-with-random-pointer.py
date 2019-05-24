#
# @lc app=leetcode id=138 lang=python
#
# [138] Copy List with Random Pointer
#

# Definition for a Node.
class Node(object):
    def __init__(self, val, next, random):
        self.val = val
        self.next = next
        self.random = random

class Solution(object):
    def copyRandomList(self, head):
        """
        :type head: Node
        :rtype: Node
        """
        dict = {}
        m = n = head
        while m:
            dict[m] = Node(m.val, None, None)
            m = m.next
        while n:
            dict[n].next = dict.get(n.next)
            dict[n].random = dict.get(n.random)
            n = n.next
        return dict.get(head)

