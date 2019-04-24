//Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
//Output: 7 -> 0 -> 8
//Explanation: 342 + 465 = 807.

public class ListNode {
	public var val: Int
	public var next: ListNode?
	public init(_ val: Int) {
		self.val = val
		self.next = nil
	}
}

class Solution {
	func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
		if l1 == nil {
			return l2
		} else if l2 == nil {
			return l1
		}
		
		var p1 = l1
		var p2 = l2
		
		var list: ListNode?
		var p: ListNode?
		
		var carry = 0
		while p1 != nil || p2 != nil {
			let result = (p1?.val ?? 0) + (p2?.val ?? 0) + carry
			
			if list == nil {
				// first node
				list = ListNode(result % 10)
				p = list
			} else {
				let node = ListNode(result % 10)
				p?.next = node
				p = p?.next
			}
			
			// next node carry
			carry = result > 9 ? 1 : 0
			
			p1 = p1?.next
			p2 = p2?.next
		}
		
		if carry == 1 {
			p?.next = ListNode(1)
		}
		
		return list
	}
}
