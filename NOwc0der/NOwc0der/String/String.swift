//
//  String.swift
//  NOwc0der
//
//  Created by Weslie on 3/31/19.
//  Copyright © 2019 weslie. All rights reserved.
//

/*
 Judge if two string is transformable
 
 e.g.:
 str1   str2    result
 ---------------------
 123    321     true
 123    2331    false
 
 - Complexity: O(n)
*/
func judgeTransformable(str1: String, str2: String) -> Bool {
    if str1.count != str2.count {
         return false
    }
    
    var dict = [Character: Int]()
    
    for char in str1 {
        if dict[char] == nil {
            dict[char] = 1
        } else {
            dict[char]! += 1
        }
    }
    
    for char in str2 {
        if dict[char] == nil {
            return false
        } else {
            dict[char]! -= 1
        }
    }
    
    for val in dict.values {
        if val != 0 {
            return false
        }
    }
    
    return true
}


/*
 Judge if two string are rotatable
 
 e.g.
 cdab <-> abcd
 */
func judgeRotatable(str1: String, str2: String) -> Bool {
    // contain all possibilities
    let union = str1 + str1
    
    // apply search
    return union.kmpContains(str2)
}


/*
 Reverse word arrange in a sentence by space.
 
 e.g.
 I'm a student.
 student. a I'm
 */
func reverse(str: String) -> String {
    var charArray = Array(str)
    
    var i = 0
    var j = charArray.count - 1
    while i <= j {
        charArray.swapAt(i, j)
        i += 1
        j -= 1
    }
    
    return String(charArray)
}

func reverse(sentence: String) -> String {
    
    let reversedSentence = reverse(str: sentence)
    let words = reversedSentence.split(separator: " ")
    
    let reversedWords = words.map { reverse(str: String($0)) }
    
    var result = ""
    for word in reversedWords {
        result = result + word + " "
    }
    
    return String(result.dropLast())
}

func rotate(_ str: String, by index: Int) -> String {
    // apply reverse twice
    if index >= str.count {
        fatalError()
    }
    
    let leftSlice = String(str.prefix(index + 1))
    let rightSlice = String(str.suffix(str.count - index - 1))
    
    let leftReversed = reverse(str: leftSlice)
    let rightReversed = reverse(str: rightSlice)
    let reversed = leftReversed + rightReversed
    
    return reverse(str: reversed)
}
