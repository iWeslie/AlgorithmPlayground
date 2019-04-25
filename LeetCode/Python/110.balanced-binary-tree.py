#
# @lc app=leetcode id=110 lang=python
#
# [110] Balanced Binary Tree
#
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution(object):
    # O(nlogn)
    def isBalanced(self, root):
        """
        :type root: TreeNode
        :rtype: bool
        """
        if not root:
            return True
        left = self.depth(root.left)
        right = self.depth(root.right)
        if abs(left - right) > 1:
            return False
        return self.isBalanced(root.left) and self.isBalanced(root.right)

    def depth(self, root):
        if not root:
            return 0
        return 1 + max(self.depth(root.left), self.depth(root.right))

    # O(n)
    def isBalanced(self, root):
        self.flag = False
        self.depth(root)
        return not self.flag
    def depth(self, root):
        if not root:
            return 0
        left = self.depth(root.left)
        right = self.depth(root.right)
        if abs(left - right) > 1:  # boundary flag
            self.flag = True
        return max(left, right) + 1

    # O(n)
    def isBalanced(self, root):
        depth = self.depth(root)
        return depth != -1
    def depth(self, root):
        if not root: return 0
        left = self.depth(root.left)
        right = self.depth(root.right)
        if left == -1 or right == -1: return -1
        if abs(left - right) > 1: return -1
        return max(left, right) + 1



