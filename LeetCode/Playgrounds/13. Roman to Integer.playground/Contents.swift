class Solution {
	func romanLetterToInt(_ char: Character) -> Int {
		switch char {
		case "I": return 1
		case "V": return 5
		case "X": return 10
		case "L": return 50
		case "C": return 100
		case "D": return 500
		case "M": return 1000
		default: return 0
		}
	}
	func romanToInt(_ s: String) -> Int {
		let chars = [Character](s)
		
		var result = 0
		for i in 0..<chars.count {
			if i < chars.count - 1 && romanLetterToInt(chars[i]) < romanLetterToInt(chars[i + 1]) {
				result -= romanLetterToInt(chars[i])
				continue
			}
			result += romanLetterToInt(chars[i])
		}
		
		return result
	}
}

let solution = Solution()
let test = "MCMXCIV"

solution.romanToInt(test)

