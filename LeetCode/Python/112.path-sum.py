#
# @lc app=leetcode id=112 lang=python
#
# [112] Path Sum
#
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution(object):
    # Recursively
    def hasPathSum(self, root, sum):
        """
        :type root: TreeNode
        :type sum: int
        :rtype: bool
        """
        if not root:
            return False
        remain = sum-root.val
        if not root.left and not root.right and remain == 0:  # leaf node
            return True
        return self.hasPathSum(root.left, remain) or self.hasPathSum(root.right, remain)

    # DFS
    def hasPathSum(self, root, sum):
        if not root:
            return False
        stack = [(root, root.val)]
        while stack:
            # pop node, push its children
            cur, val = stack.pop()
            if not cur.left and not cur.right and val == sum:
                return True
            left, right = cur.left, cur.right
            if left:
                stack.append((left, val+left.val))
            if right:
                stack.append((right, val+right.val))
        return False

    # BFS
    def hasPathSum(self, root, sum):
        if not root:
            return False
        queue = [(root, sum-root.val)]
        while queue:
            # deque node, append its children
            cur, val = queue.pop(0)
            if not cur.left and not cur.right and val == 0:
                return True
            left, right = cur.left, cur.right
            if left:
                queue.append((left, val-left.val))
            if right:
                queue.append((right, val-right.val))
        return False




