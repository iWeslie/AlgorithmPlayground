//
//  main.swift
//  NOwc0der
//
//  Created by Weslie on 3/31/19.
//  Copyright © 2019 weslie. All rights reserved.
//

let transformable = judgeTransformable(str1: "1234", str2: "4213")
print("judgeTransformable: \(transformable)")

let rotatable = judgeRotatable(str1: "abcdefg", str2: "cdefgab")
print("judgeRotatable: \(rotatable)")

let aSentence = "I'm a student."
let reversedSentence = reverse(sentence: aSentence)
print(aSentence + " -> " + reversedSentence)

let rotated = rotate("ABCDE", by: 2)
print("reversed result: \(rotated)")
