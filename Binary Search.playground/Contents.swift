//: ## Binary Search
func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
    let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
    
    let left = range.lowerBound
    let right = range.upperBound
    if key < a[midIndex] {
        return binarySearch(a, key: key, range: Range(uncheckedBounds: (left, midIndex)))
    } else if key > a[midIndex] {
        return binarySearch(a, key: key, range: Range(uncheckedBounds: (midIndex, right)))
    } else {
        return midIndex
    }
    
}

let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
binarySearch(numbers, key: 43, range: 0..<numbers.count)

func binarySearch<T: Comparable>(_ a: [T], key: T) -> Int? {
    var lower = 0
    var upper = a.count
    
    while lower < upper {
        let mid = lower + (upper - lower) / 2
        if key < a[mid] {
            upper = mid
        } else if key > a[mid] {
            lower = mid + 1
        } else {
            return mid
        }
    }
    return nil
}

binarySearch(numbers, key: 43)

//: Count Occurrences
func countOccurrencesOfKey(_ key: Int, inArray a: [Int]) -> Int {
    let index = binarySearch(a, key: key)!
    var lowerBounds: Int {
        var left = index
        while key == a[left - 1] {
            left -= 1
        }
        return left
    }
    var upperBounds: Int {
        var right = index
        while key == a[right] {
            right += 1
        }
        return right
    }
    
    return upperBounds - lowerBounds
}

let a = [ 0, 1, 1, 3, 3, 3, 3, 6, 8, 10, 11, 11 ]
countOccurrencesOfKey(3, inArray: a)
