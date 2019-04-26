#
# @lc app=leetcode id=589 lang=python
#
# [589] N-ary Tree Preorder Traversal
#
"""
# Definition for a Node.
class Node(object):
    def __init__(self, val, children):
        self.val = val
        self.children = children
"""
class Solution(object):
    def preorder(self, root):
        """
        :type root: Node
        :rtype: List[int]
        """
        res, stack = [], root and [root]
        while stack:
            node = stack.pop()
            res.append(node.val)
            stack += [child for child in node.children[::-1] if child]
        return res

