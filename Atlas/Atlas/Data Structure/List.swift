//
//  List.swift
//  Atlas
//
//  Created by Weslie Chen on 2020/3/8.
//  Copyright © 2020 weslie. All rights reserved.
//

/// Sequencial List Protocol
public protocol List {
    associatedtype T
    
    var size: Int { get }
    var description: String { get }
    
    func insert(_ value: T, at index: Int)
    func set(_ value: T, at index: Int) -> T
    func get(_ index: Int) -> T
    func remove(at index: Int) -> T
    func removeAll()
}

extension List {
    public var isEmpty: Bool {
        return size == 0
    }
    
    public func append(_ value: T) {
        insert(value, at: size)
    }
    
    internal func _checkRange(_ index: Int) {
        if index < 0 || index >= size {
            fatalError("Index out of bounds")
        }
    }
    internal func _checkAppendingRange(_ index: Int) {
        if index < 0 || index > size {
            fatalError("Index out of bounds")
        }
    }
}

extension List where T: Equatable {
    public func contains(_ value: T) -> Bool {
        fatalError("Should be implemented by subclass")
    }
    
    public func index(of value: T) -> Int {
        fatalError("Should be implemented by subclass")
    }
}
