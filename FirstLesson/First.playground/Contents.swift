//: Playground - Alogrithm demo
import UIKit
// MARK:- max continuous sub array
///给定一个数组A[0,...,n-1]，求A的连续子数 组，使得该子数组的和最大。
//暴力法
//分治法
//分析法
//动态规划法

// TODO:- 1.暴力法
// 直接求解A[i,...j]的值
// 0≤ i < n
// i≤ j < n
// i,i+1...,j-1,j的最大长度为n
// 因此:时间复杂度O(n3)

let testArray = [1, -2, 3, 10, -4, 7, 2, -5]

func maxSubArrray_violance(_ array: [Int]) -> Int {
    
    var maxSum = array[0]
    let n = array.count
    var currentSum = 0
    
    for i in 0..<n {
        for j in i..<n {
            currentSum = 0
            for k in i...j {
                currentSum += array[k]
            }
            if currentSum > maxSum {
                maxSum = currentSum
            }
        }
    }
    return maxSum
}

maxSubArrray_violance(testArray)

// TODO:- 2.分治法
// 将数组从中间分开，那么最大子数组要么完 全在左半边数组，要么完全在右半边数组， 要么跨立在分界点上。
// 完全在左数组、右数组递归解决。
// 跨立在分界点上:实际上是左数组的最大后 缀和右数组的最大前缀的和。因此，从分界 点向前扫，向后扫即可。

func maxSubArrray_divide(_ array: [Int], _ from: Int, _ to: Int) -> Int {
    
    if to == from {
        return array[from]
    }
    
    let middle = (from + to) / 2
    
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

maxSubArrray_divide(testArray, 0, 7)

// TODO:- 4.动态规划
// 记S[i]为以A[i]结尾的数组中和最大的子数组
// 则:S[i+1] = max(S[i]+A[i+1], A[i+1])
// S[0]=A[0]

func maxSubArray_dynamic(_ array: [Int]) -> Int {
    
    var result = array[0]

    var sum = array[0]

    for i in 0..<array.count {
        if sum > 0 {
            sum += array[i]
        } else {
            sum = array[i]
        }

        if sum > result {
            result = sum
        }
    }

    return result
}

maxSubArray_dynamic(testArray)


