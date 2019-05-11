#
# @lc app=leetcode id=700 lang=python
#
# [700] Search in a Binary Search Tree
#
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution(object):
    def searchBST(self, root, val):
        """
        :type root: TreeNode
        :type val: int
        :rtype: TreeNode
        """
        if root and root.val < val:
            return self.searchBST(root.right, val)
        elif root and root.val > val:
            return self.searchBST(root.left, val)
        return root

