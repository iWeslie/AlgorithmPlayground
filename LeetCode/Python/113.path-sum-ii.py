#
# @lc app=leetcode id=113 lang=python
#
# [113] Path Sum II
#
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution(object):
    # DFS Iteratively
    def pathSum(self, root, s):
        """
        :type root: TreeNode
        :type sum: int
        :rtype: List[List[int]]
        """
        if not root: return []
        stack, res = [(root, [root.val])], []
        while stack:
            # pop node, push its children
            cur, paths = stack.pop()
            if not cur.left and not cur.right and sum(paths) == s:
                res.append(paths)
            left, right = cur.left, cur.right
            if left:
                stack.append((left, paths+[left.val]))
            if right:
                stack.append((right, paths+[right.val]))
        return res

    # DFS Recursively
    def dfs(self, root, sum, ls, res):
        if not root.left and not root.right and sum == root.val:
            ls.append(root.val)  # one possible path
            res.append(ls)  # last result
        if root.left:
            self.dfs(root.left, sum-root.val, ls+[root.val], res)
        if root.right:
            self.dfs(root.right, sum-root.val, ls+[root.val], res)
    def pathSum(self, root, s):
        if not root: return []
        res = []
        self.dfs(root, sum, [], res)
        return res

