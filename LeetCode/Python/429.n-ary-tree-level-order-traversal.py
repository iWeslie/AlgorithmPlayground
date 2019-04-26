#
# @lc app=leetcode id=429 lang=python
#
# [429] N-ary Tree Level Order Traversal
#
"""
# Definition for a Node.
class Node(object):
    def __init__(self, val, children):
        self.val = val
        self.children = children
"""
class Solution(object):
    def levelOrder(self, root):
        """
        :type root: Node
        :rtype: List[List[int]]
        """
        if not root: return []
        res, level = [], [root]
        while level:
            res.append([node.val for node in level])
            tmp = []
            for node in level:
                tmp += node.children
                level = [node for node in tmp if node]
        return res

