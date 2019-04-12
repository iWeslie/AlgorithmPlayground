//
//  Sort.swift
//  NOwc0der
//
//  Created by Weslie on 4/1/19.
//  Copyright © 2019 weslie. All rights reserved.
//

/// - Complexity: O(n^2)
func bubbleSort(_ array: [Int]) -> [Int] {
    var arr = array
    let n = array.count
    
    for _ in 0..<n {
        for j in 1..<n {
            if arr[j - 1] > arr[j] {
                arr.swapAt(j, j - 1)
            }
        }
    }
    return arr
}

/// - Complexity: O(n^2)
func selectionSort(_ array: [Int]) -> [Int] {
    var arr = array
    let n = array.count
    
    for i in 0..<n {
        var min = i
        for j in i+1..<n {
            if arr[j] < arr[min] {
                min = j
            }
        }
        if i != min {
            arr.swapAt(i, min)
        }
    }
    return arr
}

/// - Complexity: O(n^2)
func insertionSort(_ array: [Int]) -> [Int] {
    var arr = array
    let n = arr.count
    
    for i in 1..<n {
        var j = i
        while j > 0 && arr[j] < arr[j - 1] {
            arr.swapAt(j, j - 1)
            j -= 1
        }
    }
    
    return arr
}
