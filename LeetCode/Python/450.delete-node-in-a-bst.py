#
# @lc app=leetcode id=450 lang=python
#
# [450] Delete Node in a BST
#
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution(object):
    def deleteNode(self, root, key):
        """
        :type root: TreeNode
        :type key: int
        :rtype: TreeNode
        """
        if not root:
            return root
        if key < root.val:
            root.left = self.deleteNode(root.left, key)
        elif key > root.val:
            root.right = self.deleteNode(root.right, key)
        else:
            # one child
            if not root.right:
                return root.left
            if not root.left:
                return root.right
            # two children
            node = root.right
            mini = node.val
            while node.left:
                node = node.left
                mini = node.val
            root.val = mini
            root.right = self.deleteNode(root.right, root.val)
        return root
