//
//  File.swift
//  SwiftLiveOrderedMap
//
//  Created by Shubham Deshmukh on 08/07/25.
//

import Foundation
final class Storage<Key: Comparable, Value> {
    var tree: AVLTree<Key, Value>

    init() {
        self.tree = AVLTree()
    }

    func copy() -> Storage<Key, Value> {
        let newStorage = Storage<Key, Value>()
        newStorage.tree.root = self.tree.copyTree()
        return newStorage
    }
}
