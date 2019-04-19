# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None

# Definition for a binary tree node.
class TreeNode(object):
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Solution(object):
    # recursion + array conversion
    def sortedListToBST(self, head):
        """
        :type head: ListNode
        :rtype: TreeNode
        """
        nums = []
        while head:
            nums.append(head.val)
            head = head.next

        def helper(nums):
            if not nums: return
            i = len(nums) // 2
            root = TreeNode(nums[i])
            root.left = helper(nums[:i])
            root.right = helper(nums[i+1:])

            return root

        return helper(nums)

    # recursion withput array conversion
    def findMiddle(self, head):
        prev, slow, fast = None, head, head
        while fast and fast.next:
            prev, slow, fast = slow, slow.next, fast.next.next
        if prev:  # tear down to two lists
            prev.next = None
        return slow

    def sortedListToBST(self, head):
        if not head: return
        mid = self.findMiddle(head)
        node = TreeNode(mid.val)
        if head == mid:
            return node

        node.left = self.sortedListToBST(head)
        node.right = self.sortedListToBST(mid.next)
        return node
