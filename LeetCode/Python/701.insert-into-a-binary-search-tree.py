#
# @lc app=leetcode id=701 lang=python
#
# [701] Insert into a Binary Search Tree
#
# Definition for a binary tree node.
class TreeNode(object):
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution(object):
    def insertIntoBST(self, root, val):
        """
        :type root: TreeNode
        :type val: int
        :rtype: TreeNode
        """
        origin_root = node = root
        if not root:
            return TreeNode(val)
        while True:
            target = node.val
            if not node.left and not node.right:
                if val < target:
                    node.left = TreeNode(val)
                elif val > target:
                    node.right = TreeNode(val)
                return origin_root
            elif node.left and node.right:
                node = node.left if val < target else node.right
            elif node.left:
                if val > target:
                    node.right = TreeNode(val)
                else:
                    node = node.left
            elif node.right:
                if val < target:
                    node.left = TreeNode(val)
                else:
                    node = node.right

