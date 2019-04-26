#
# @lc app=leetcode id=559 lang=python
#
# [559] Maximum Depth of N-ary Tree
#
"""
# Definition for a Node.
class Node(object):
    def __init__(self, val, children):
        self.val = val
        self.children = children
"""
class Solution(object):
    def maxDepth(self, root):
        """
        :type root: Node
        :rtype: int
        """
        if not root: return 0
        if not root.children: return 1
        return max(self.maxDepth(node) for node in root.children) + 1

