//: # Longest Common Subsequence
//: ### Dynamic Programming

let stringA = "ABCDBAB"
let stringB = "BDCABA"

func print(_ arr: [[Int]]) {
    var result = ""
    for row in arr {
        for element in row {
            result += "\(element)\t"
        }
        result += "\n"
        
    }
    print(result)
}

func lcs(_ str1: String, _ str2: String) -> String {
    var arr1 = Array(str1)
    var arr2 = Array(str2)
    arr1.insert("$", at: 0)
    arr2.insert("$", at: 0)
    let n = arr1.count
    let m = arr2.count
    
    var chess = Array(repeating: Array(repeating: 0, count: m), count: n)
    
    for i in 1..<n {
        for j in 1..<m {
            if arr1[i] == arr2[j] {
                chess[i][j] = chess[i-1][j-1] + 1
            } else {
                chess[i][j] = max(chess[i][j-1], chess[i-1][j])
            }
        }
    }
    
    print(chess)
    
    
    var i = n - 1
    var j = m - 1
    
    var result = ""
    while i > 0 && j > 0 {
        if arr1[i] == arr2[j] {
            result.append(arr1[i])
            i -= 1
            j -= 1
        } else {
            if chess[i][j-1] > chess[i-1][j] {
                j -= 1
            } else {
                i -= 1
            }
        }
    }
    
    return String(result.reversed())
}


lcs(stringA, stringB)
//lcs("BCDABAB", "CBACBAABAD")

