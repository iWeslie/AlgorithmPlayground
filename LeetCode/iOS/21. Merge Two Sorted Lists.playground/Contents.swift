public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}



class Solution {
	func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
		
		if l1 == nil {
			return l2
		} else if l2 == nil {
			return l1
		}
		
		var p1 = l1
		var p2 = l2
		
		var list: ListNode!
		
		if p1!.val <= p2!.val {
			let node = ListNode(p1!.val)
			list = node
			p1 = p1?.next
		} else {
			let node = ListNode(p2!.val)
			list = node
			p2 = p2?.next
		}
		var p = list
		
		while p1 != nil && p2 != nil {
			if p1!.val <= p2!.val {
				let node = ListNode(p1!.val)
				p?.next = node
				p = p?.next
				p1 = p1?.next
			} else {
				let node = ListNode(p2!.val)
				p?.next = node
				p = p?.next
				p2 = p2?.next
			}
		}
		
		if p1 == nil {
			p?.next = p1
		} else if p2 == nil {
			p?.next = p2
		}
		
		return list
	}
}

