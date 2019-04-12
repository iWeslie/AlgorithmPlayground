//
//  KMP.swift
//  NOwc0der
//
//  Created by Weslie on 3/31/19.
//  Copyright © 2019 weslie. All rights reserved.
//

private func getNext(pattern: [Character]) -> [Int] {
    var i = 0
    var j = -1
    var next = Array(repeating: 0, count: pattern.count)
    next[0] = -1
    
    while i < pattern.count - 1 {
        if j == -1 || pattern[i] == pattern[j] {
            i += 1
            j += 1
            if pattern[i] != pattern[j] {
                next[i] = j
            } else {
                next[i] = next[j]
            }
        } else {
            j = next[j]
        }
    }
    
    return next
}

func kmp(text: [Character], pattern: [Character]) -> Int {
    let next = getNext(pattern: pattern)
    
    var i = 0
    var j = 0
    
    while i < text.count && j < pattern.count {
        if j == -1 || text[i] == pattern[j] {
            i += 1
            j += 1
        } else {
            j = next[j]
        }
    }
    
    if j == pattern.count {
        return i - j
    }
    
    return -1
}

extension String {
    func kmpContains(_ anotherString: String) -> Bool {
        let str = Array(self)
        let pattern = Array(anotherString)
        return kmp(text: str, pattern: pattern) == -1 ? false : true
    }
}
