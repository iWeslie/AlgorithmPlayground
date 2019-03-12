import Foundation

func sockMerchant(n: Int, ar: [Int]) -> Int {
	var bucket = [Int: Int]()
	var count = 0
	for num in ar {
		if bucket[num] == nil {
			bucket[num] = 1
			print(bucket)
		} else {
			bucket[num]! += 1
		}
	}
	for dict in bucket {
		count += dict.value / 2
	}
	
	return count
}

sockMerchant(n: 9, ar: [10,20,20,10,10,30,50,10,20])
