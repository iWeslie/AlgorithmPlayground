#
# @lc app=leetcode id=590 lang=python
#
# [590] N-ary Tree Postorder Traversal
#
"""
# Definition for a Node.
class Node(object):
    def __init__(self, val, children):
        self.val = val
        self.children = children
"""
class Solution(object):
    def postorder(self, root):
        """
        :type root: Node
        :rtype: List[int]
        """
        res, stack = [], root and [root]
        while stack:
            node = stack.pop()
            res.append(node.val)
            stack += [child for child in node.children if child]
        res.reverse()
        return res
