# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution(object):
    # recursive
    def postorderTraversal(self, root):
        """
        :type root: TreeNode
        :rtype: List[int]
        """
        return [] if not root else self.postorderTraversal(root.left) + self.postorderTraversal(root.right) + [root.val]

    # iterative normalize
    def postorderTraversal(self, root):
        stack, res = [], []
        while root or stack:
            if root:
                stack.append(root)
                res.append(root.val)
                root = root.right
            else:
                root = stack.pop()
                root = root.left

    # iterative normalize
    def postorderTraversal(self, root):
        stack, res = [], []
        while root or stack:
            if root:
                stack.append(root)
                res.append(root.val)
                root = root.right
            else:
                root = stack.pop()
                root = root.left
        res.reverse()
        return res
