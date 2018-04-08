//
//  main.swift
//  First
//
//  Created by Weslie on 2018/4/6.
//  Copyright © 2018 Weslie. All rights reserved.
//

import Foundation

let testArray = [1, -2, 3, 10, -4, 7, 2, -5]

func maxSubArrray_divide(_ array: [Int], _ from: Int, _ to: Int) -> Int {
    
    if to == from {
        return array[from]
    }
    
    let middle = Int((from + to) / 2)
    
    let m1 = maxSubArrray_divide(array, from, middle)
    let m2 = maxSubArrray_divide(array, middle + 1, to)
    
    var left = array[middle]
    var right = array[middle + 1]
    var currentValue = array[middle]
    
    var leftIndex = middle
    var rightIndex = middle + 1
    
    for _ in 0..<middle {
        leftIndex -= 1
        if leftIndex > 0 {
            currentValue += array[leftIndex]
            left = max(currentValue, left)
        }
    }
    
    currentValue = array[middle + 1]
    for _ in middle + 1..<array.count {
        rightIndex += 1
        if rightIndex < array.count {
            currentValue += array[rightIndex]
            right = max(currentValue, right)
        }
    }
    
    let m3 = left + right
    
    return max(m1, m2, m3, 0)
    
}

let result = maxSubArrray_divide(testArray, 0, 7)

print(result)

