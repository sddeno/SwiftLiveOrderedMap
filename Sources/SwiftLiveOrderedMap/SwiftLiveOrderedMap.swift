// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
public struct SwiftLiveOrderedMap<Key: Comparable, Value> {
    private var storage: Storage<Key, Value>

    public init() {
        self.storage = Storage()
    }

    public var isEmpty: Bool {
        storage.tree.root == nil
    }

    public var count: Int {
        storage.tree.count
    }

    public subscript(key: Key) -> Value? {
        get {
            storage.tree.search(key)?.value
        }
        set {
            ensureUniqueStorage()
            if let newValue = newValue {
                storage.tree.insert(key: key, value: newValue)
            } else {
                storage.tree.delete(key)
            }
        }
    }

    public mutating func insert(_ key: Key, value: Value) {
        ensureUniqueStorage()
        storage.tree.insert(key: key, value: value)
    }

    public mutating func removeValue(forKey key: Key) {
        ensureUniqueStorage()
        storage.tree.delete(key)
    }

    public func contains(_ key: Key) -> Bool {
        storage.tree.search(key) != nil
    }

    public mutating func removeAll() {
        ensureUniqueStorage()
        storage.tree.root = nil
    }
    
//    @discardableResult
//    public mutating func remove(_ key: Key) -> Value? {
//        let oldValue = self[key] // get current value (if exists)
//        ensureUniqueStorage()    // make sure we're not modifying shared storage
//        storage.root = AVLTree.delete(storage.root, key) // delete from tree
//        return oldValue // return the value that was removed
//    }


    public var keys: [Key] {
        storage.tree.inOrderTraversal().map { $0.key }
    }

    public var values: [Value] {
        storage.tree.inOrderTraversal().map { $0.value }
    }

    public var items: [(Key, Value)] {
        storage.tree.inOrderTraversal().map { ($0.key, $0.value) }
    }

    private mutating func ensureUniqueStorage() {
        if !isKnownUniquelyReferenced(&storage) {
            storage = storage.copy()
        }
    }
}
