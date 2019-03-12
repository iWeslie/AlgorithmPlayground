import Foundation

func staircase(n: Int) -> Void {
	for i in stride(from: n - 1, through: 0, by: -1) {
		let sharpCount = n - i
		let spaceCount = i
		print(String(repeating: " ", count: spaceCount) + String(repeating: "#", count: sharpCount))
	}
}


staircase(n: 4)


func miniMaxSum(arr: [Int]) -> Void {
	var min = arr[0]
	var max = arr[1]
	var result = 0
	for i in 0..<arr.count {
		if min < arr[i] {
			min = arr[i]
		} else if max > arr[i] {
			max = arr[i]
		}
		result += arr[i]
	}
	
	print("\(result - min) \(result - max)")
}

func birthdayCakeCandles(ar: [Int]) -> Int {
	var max = ar[0]
	var count = 0
	for i in 0..<ar.count {
		if ar[i] > max {
			max = ar[i]
			count = 1
		} else if ar[i] == max {
			count += 1
		}
	}
	return count
}


func timeConversion(s: String) -> String {
	/*
	* Write your code here.
	*/
	if s.contains("PM") {
		let pmStr = s.replacingOccurrences(of: "PM", with: "")
		let hr = Int(pmStr.prefix(2))!
		let left = String(pmStr.suffix(6))
		if hr == 12 {
			return pmStr
		} else {
			return "\(hr + 12)" + left
		}
		
	} else {
		let amStr = s.replacingOccurrences(of: "AM", with: "")
		let hr = Int(amStr.prefix(2))!
		let left = String(amStr.suffix(6))
		if hr == 12 {
			return "00" + left
		} else {
			return amStr
		}
	}
}

timeConversion(s: "07:05:45PM")
