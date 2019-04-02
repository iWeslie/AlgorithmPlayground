# Definition for a binary tree node.
class TreeNode(object):
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution(object):
    def depth(self, root):
        if not root:
            return 0
        return self.depth(root.left) + self.depth(root.right) + 1

    def isBalanced(self, root):
        """
        :type root: TreeNode
        :rtype: bool
        """
        if not root:
            return True
        diff = abs(self.depth(root.left) - self.depth(root.right))
        print(diff)
        return True if diff <= 1 else False
