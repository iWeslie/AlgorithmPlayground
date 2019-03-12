class Solution {
	enum CarryType: Int {
		case basic = 0
		case tens = 1
		case hundurd = 2
		case thousand = 3
	}
	func digitToRoman(_ num: Int, at carry: CarryType) -> String {
		switch num {
		case 1...3:
			let str: Character
			switch carry {
			case .basic: 	str = "I"
			case .tens:		str = "X"
			case .hundurd: 	str = "C"
			case .thousand: str = "M"
			}
			let charArray: [Character] = Array(repeating: str, count: num)
			return String(charArray)
		case 4:
			var str = ""
			switch carry {
			case .basic: 	str = "IV"
			case .tens:		str = "XL"
			case .hundurd: 	str = "CD"
			default: break
			}
			return str
		case 5...8:
			let str: Character
			let mid: String
			switch carry {
			case .basic: 	str = "I"; mid = "V"
			case .tens:		str = "X"; mid = "L"
			case .hundurd: 	str = "C"; mid = "D"
			case .thousand: str = "M"; mid = ""
			}
			let charArray: [Character] = Array(repeating: str, count: num - 5)
			return mid + String(charArray)
		case 9:
			var str = ""
			switch carry {
			case .basic: 	str = "IX"
			case .tens:		str = "XC"
			case .hundurd: 	str = "CM"
			default: break
			}
			return str
		default: return ""
		}
	}
	
	func intToRoman(_ num: Int) -> String {
		var x = num
		var result = ""
		var raw = 0
		while x > 0 {
			let y = x % 10
			let metaString = digitToRoman(y, at: Solution.CarryType.init(rawValue: raw)!)
			raw += 1
			result = "\(metaString)\(result)"
			x /= 10
		}
		return result
	}
}

let solution = Solution()
let test = 1994

solution.intToRoman(test)

