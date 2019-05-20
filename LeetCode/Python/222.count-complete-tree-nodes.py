#
# @lc app=leetcode id=222 lang=python
#
# [222] Count Complete Tree Nodes
#
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution(object):
    def countNodes(self, root):
        """
        :type root: TreeNode
        :rtype: int
        """
        return 1 + self.countNodes(root.left) + self.countNodes(root.right) if root else 0

