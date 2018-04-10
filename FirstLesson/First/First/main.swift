//
//  main.swift
//  First
//
//  Created by Weslie on 2018/4/6.
//  Copyright © 2018 Weslie. All rights reserved.
//

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
//maxSubArrray_violance(testArray)
print("maxSubArrray_violance: \t\(maxSubArrray_violance(testArray))")

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
//maxSubArrray_divide(testArray, 0, 7)
print("maxSubArrray_divide: \t\(maxSubArrray_divide(testArray, 0, 7))")

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
//maxSubArray_dynamic(testArray)
print("maxSubArray_dynamic: \t\(maxSubArray_dynamic(testArray))")


// MARK:- search rotated arrray minimum
/// 假定一个排序数组以某个未知元素为支点做 了旋转，如:原数组0 1 2 4 5 6 7旋转后得到 4 5 6 7 0 1 2。
/// 请找出旋转后数组的最小值。 假定数组中没有重复数字。

// TODO:- 双指针
// 旋转之后的数组实际上可以划分成两个有序的子数组；前面子数组的大小都大于后面子数组中的元素
// 用两个指针low，high分别指向数组的第一个元素 和最后一个元素。如果是正常的排序数组(元素间 不重复)，第一个元素肯定小于最后一个元素。


let testArray2 = [4, 5, 6, 7, 0, 1, 2]
func searchMin(_ array: [Int]) -> Int {

    var low = 0
    var high = array.count - 1
    
    var mid = 0
    
    while low < high {
        mid = (low + high) / 2
        if array[mid] < array[high] {
            high = mid
        } else if array[mid] > array[high] {
            low = mid + 1
        }
    }
    return array[low]
    
}

//searchMin(testArray2)
print("searchMin: \t\(searchMin(testArray2))")

// MARK:- zero sub array
/// 求对于长度为N的数组A，求子数组的和接 近0的子数组，要求时间复杂度O(NlogN)

// 申请同样长度的空间sum[0...N-1]，sum[i]是A的前i项和。
// 定义sum[-1] = 0
// 对sum[0...N-1]排序，然后计算sum相邻元素的差，最小值记为mim1.
// min1:在A中任意取两个集合，各自元素的和求 差的最小值
// 因为sum[-1]=0，sum[0...N-1]的绝对值最小值记为min2。
// min2:A的前k个元素的和的绝对值的最小值


// MARK:- Longest Common Subsequence

// 若xm=yn(最后一个字符相同)，则:Xm与Yn 的最长公共子序列Zk的最后一个字符必定为 xm(=yn)。
// zk=xm=yn
// LCS(Xm , Yn) = LCS(Xm-1 , Yn-1) + xm

let x: [Character] = ["A", "B", "C", "B", "D", "A", "B"]
let y: [Character] = ["B", "D", "C", "A", "B", "A"]

func LCS_length(array1: [Character], array2: [Character]) -> [[Int]] {
    
    var count = [[Int]]()
    var arrow = [[Character]]()
    
    let m = array1.count
    let n = array2.count
    
    for _ in 0...m {
        let arrA = Array(repeating: 0, count: n + 1)
        count.append(arrA)
        let arrB = Array(repeating: Character("-"), count: n + 1)
        arrow.append(arrB)
    }
    
    print(count)
    print(arrow)
    
    for i in 1..<m {
        for j in 1..<n {
            if array1[i] == array2[j] {
                count[i][j] = count[i - 1][j - 1] + 1
                arrow[i][j] = "↖︎"
            } else if count[i - 1][j] >= count[i][j - 1] {
                count[i][j] = count[i - 1][j]
                arrow[i][j] = "↑"
            } else {
                count[i][j] = count[i][j - 1]
                arrow[i][j] = "←"
            }
        }
    }
    return count
    
}

LCS_length(array1: x, array2: y)
print(LCS_length(array1: x, array2: y))
















