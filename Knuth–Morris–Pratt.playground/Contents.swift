//: # Bruto-Force
let textString = "BBC ABCDAB ABCDABCDABDE"
let patternString = "ABCDABD"

let text = Array(textString)
let pattern = Array(patternString)

func brutoForce() -> Int {
    var i = 0
    var j = 0
    
    while i < text.count && j < pattern.count {
        if text[i] == pattern[j] {
            i += 1
            j += 1
        } else {
            i = i - j + 1
            j = 0
        }
    }
    
    if j == pattern.count {
        return i - j
    }
    
    return -1
}

brutoForce()


//: # Knuth-Morris-Pratt
func getNext(pattern: [Character]) -> [Int] {
    var i = 0
    var j = -1
    var next = Array(repeating: 0, count: pattern.count)
    next[0] = -1
    
    while i < pattern.count - 1 {
        if j == -1 || pattern[i] == pattern[j] {
            i += 1
            j += 1
            next[i] = j
            /*: optimized version
             if pattern[i] != pattern[j] {
                 next[i] = j
             } else {
                 next[i] = next[j]
             }
             */
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

kmp(text: text, pattern: pattern)
