# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution(object):
    # recursive
    def isValidBST(self, root):
        """
        :type root: TreeNode
        :rtype: bool
        """
        if not root:
            return True

        def helper(node, lower, upper):
            # lowr is not None
            if lower is not None and node.val <= lower:
                return False
            if upper is not None and upper <= node.val:
                return False

            left = helper(node.left, lower, node.val) if node.left else True
            if left:
                right = helper(node.right, node.val, upper) if node.right else True
                return right
            else:
                return False

        return helper(root, None, None)

    # iterative
    def isValidBST(self, root):
        if not root: return True

        stack = [(root, None, None)]
        while stack:
            root, lower, upper = stack.pop()
            if root.right:
                if root.right.val > root.val:
                    if upper and root.right.val >= upper:
                        return False
                    stack.append((root.left, root.val, upper))
                else:
                    return False
            if root.left:
                if root.left.val < root.val:
                    if lower and root.left.val <= lower:
                        return False
                    stack.append((root.right, lower, root.val))
                else:
                    return False
        return True

    # inorder traversal -> ascending array
    def isValidBST(self, root):
        stack, inorder = [], float('-inf')

        while stack or root:
            while root:
                stack.append(root)
                root = root.left
            root = stack.pop()
            # if next elem in inorder <= previous, not BST
            if root.val <= inorder:
                return False
            inorder = root.val
            root = root.right

        return True
