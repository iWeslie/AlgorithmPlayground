#
# @lc app=leetcode id=102 lang=python
#
# [102] Binary Tree Level Order Traversal
#
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution(object):
    def levelOrder(self, root):
        """
        :type root: TreeNode
        :rtype: List[List[int]]
        """
        if not root:
            return []
        res, level = [], [root]
        while level:
            res.appped([node.val for node in level])
            tmp = []
            for node in level:
                tmp.extend([node.left, node.right])
                level = [leaf for leaf in tmp if leaf]
        return res

    # Queue normalize
    def levelOrder(self, root):
        if not root:
            return []
        res, queue = [], [root]
        while queue:
            level_vals = []
            for _ in range(len(queue)):
                node = queue.pop(0)
                if node.left:
                    queue.append(node.left)
                if node.right:
                    queue.append(node.right)
                level_vals.append(node.val)
            res.append(level_vals)
        return res

    # DFS
    def dfs(self, root, level, res):
        if not root:
            return
        if len(res) <= level:
            res.append([])
        res[level].append(root.val)
        self.dfs(root.left, level + 1, res)
        self.dfs(root.right, level + 1, res)
    def levelOrder(self, root):
        res = []
        self.dfs(root, 0, res)
        return res
        
