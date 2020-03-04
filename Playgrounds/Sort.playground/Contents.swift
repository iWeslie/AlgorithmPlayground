import UIKit
//: # Insertion Sort
func insertionSort(_ array: [Int]) -> [Int] {
    var a = array
    for i in 1..<array.count {
        var j = i
        while j > 0 && a[j] < a[j - 1] {
            a.swapAt(j, j - 1)
            j -= 1
        }
    }
    return a
}

let list = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
insertionSort(list)

func insertionSortNoSwapping(_ array: [Int]) -> [Int] {
    var a = array
    for i in 1..<array.count {
        var j = i
        let temp = a[j]
        while j > 0 && a[j] < a[j - 1] {
            a[j] = a[j - 1]
            j -= 1
        }
        a[j] = temp
    }
    return a
}

insertionSortNoSwapping(list)

func insertionSort<T>(_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    var a = array
    for i in 1..<a.count {
        var j = i
        let temp = a[j]
        while j > 0 && isOrderedBefore(temp, a[j - 1]) {
            a[j] = a[j - 1]
            j -= 1
        }
        a[j] = temp
    }
    return a
}
insertionSort(list) { $0 < $1 }

//: # Selection Sort
func selectionSort(_ array: [Int]) -> [Int] {
    guard array.count > 0 else { return array }
    
    var a = array
    let n = array.count
    /// Note: The outer loop ends at index a.count - 2.
    /// The very last element will automatically be in the correct position
    /// because at that point there are no other smaller elements left
    for index in 0..<n - 1 {
        var minIndex = index
        /// Find the min element index of rest array
        for j in index + 1 ..< n {
            if a[j] < a[minIndex] {
                minIndex = j
            }
        }
        /// Do not swap if unnecessary
        if index != minIndex {
            a.swapAt(index, minIndex)
        }
    }
    return a
}

selectionSort(list)

//: # Shell Sort
//: > Shell sort is based on insertion sort as a general way to improve its performance, by breaking the original list into smaller sublists which are then individually sorted using insertion sort.
func insertionSort(_ list: inout [Int], start: Int, gap: Int) {
    for i in stride(from: (start + gap), to: list.count, by: gap) {
        let currentValue = list[i]
        var pos = i
        while pos >= gap && list[pos - gap] > currentValue {
            list[pos] = list[pos - gap]
            pos -= gap
        }
        list[pos] = currentValue
    }
}
func shellSort(_ list: inout [Int]) {
    var sublistCount = list.count / 2
    while sublistCount > 0 {
        for pos in 0..<sublistCount {
            insertionSort(&list, start: pos, gap: sublistCount)
        }
        sublistCount /= 2
    }
}

var shellSortList = list
shellSort(&shellSortList)

//: # Quicksort
func quickSort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else { return a }
    
    let pivot = a[a.count / 2]
    let less = a.filter { $0 < pivot }
    let equal = a.filter { $0 == pivot }
    let greater = a.filter { $0 > pivot }
    
    return quickSort(less) + equal + quickSort(greater)
}

quickSort(list)

func partitionLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[high]
    
    var i = low
    for j in low..<high {
        if a[j] <= pivot {
            (a[i], a[j]) = (a[j], a[i])
            i += 1
        }
    }
    
    (a[i], a[high]) = (a[high], a[i])
    return i
}

func quicksortRandom<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let pivotIndex = Int.random(in: low ... high)
        
        (a[pivotIndex], a[high]) = (a[high], a[pivotIndex])
        
        let p = partitionLomuto(&a, low: low, high: high)
        quicksortRandom(&a, low: low, high: p - 1)
        quicksortRandom(&a, low: p + 1, high: high)
    }
}

var list1 = list
quicksortRandom(&list1, low: 0, high: list1.count - 1)
