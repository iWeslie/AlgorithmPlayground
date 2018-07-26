////: k-th Largest Element Problem
//import UIKit
//
//func randomizedSelect<T: Comparable>(_ array: [T], order k: Int) -> T {
//    var a = array
//    /// Pick a random element in the array, swap it with the end element
//    func randomPivot(_ a: inout [T], low: Int, high: Int) -> T {
//        let pivotIndex = Int.random(in: low ... high)
//        a.swapAt(pivotIndex, high)
//        return a[high]
//    }
//
//    /// Partition the array and return the pivot's index
//    func randomizedPartition(_ a: inout [T], _ low: Int, _ high: Int) -> Int {
//        let pivot = randomPivot(&a, low: low, high: high)
//        var i = low
//        for j in low..<high {
//            if a[j] <= pivot {
//                a.swapAt(i, j)
//                i += 1
//            }
//        }
//        return i
//    }
//
//    func randomizedSelect<T: Comparable>(_ array: inout [T], _ low: Int, _ high: Int, _ k: Int) -> T {
//        if low < high {
//            let p = randomizedPartition(&a, low, high)
//            if k == p {
//                return array[p]
//            } else if k < p {
//                return randomizedSelect(&a, low, p - 1, k) as! T
//            } else {
//                return randomizedSelect(&a, p + 1, high, k) as! T
//            }
//        } else {
//            return a[low] as! T
//        }
//    }
//
//    precondition(a.count > 0)
//    return randomizedSelect(&a, 0, a.count - 1, k)
//}
//
//let a = [ 7, 92, 23, 9, -1, 0, 11, 6 ]
//print(a.sorted())
//randomizedSelect(a, order: 4)


import Foundation

/*
 Returns the k-th largest value inside of an array a.
 This is an O(n log n) solution since we sort the array.
 */
public func kthLargest(_ a: [Int], _ k: Int) -> Int? {
    let len = a.count
    if k > 0 && k <= len {
        let sorted = a.sorted()
        return sorted[len - k]
    } else {
        return nil
    }
}

// MARK: - Randomized selection
/* Returns a random integer in the range min...max, inclusive. */
public func random(min: Int, max: Int) -> Int {
    assert(min < max)
    return min + Int(arc4random_uniform(UInt32(max - min + 1)))
}

/*
 Returns the i-th smallest element from the array.
 This works a bit like quicksort and a bit like binary search.
 The partitioning step picks a random pivot and uses Lomuto's scheme to
 rearrange the array; afterwards, this pivot is in its final sorted position.
 If this pivot index equals i, we're done. If i is smaller, then we continue
 with the left side, otherwise we continue with the right side.
 Expected running time: O(n) if the elements are distinct.
 */
public func randomizedSelect<T: Comparable>(_ array: [T], order k: Int) -> T {
    var a = array
    
    func randomPivot<T: Comparable>(_ a: inout [T], _ low: Int, _ high: Int) -> T {
        let pivotIndex = random(min: low, max: high)
        a.swapAt(pivotIndex, high)
        return a[high]
    }
    
    func randomizedPartition<T: Comparable>(_ a: inout [T], _ low: Int, _ high: Int) -> Int {
        let pivot = randomPivot(&a, low, high)
        var i = low
        for j in low..<high {
            if a[j] <= pivot {
                a.swapAt(i, j)
                i += 1
            }
        }
        a.swapAt(i, high)
        return i
    }
    
    func randomizedSelect<T: Comparable>(_ a: inout [T], _ low: Int, _ high: Int, _ k: Int) -> T {
        if low < high {
            let p = randomizedPartition(&a, low, high)
            if k == p {
                return a[p]
            } else if k < p {
                return randomizedSelect(&a, low, p - 1, k)
            } else {
                return randomizedSelect(&a, p + 1, high, k)
            }
        } else {
            return a[low]
        }
    }
    
    precondition(a.count > 0)
    return randomizedSelect(&a, 0, a.count - 1, k)
}


randomizedSelect([ 7, 92, 23, 9, -1, 0, 11, 6 ], order: 4)
