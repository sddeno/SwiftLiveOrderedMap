//
//  AVLTreeNode.swift
//  
//
//  Created by Shubham Deshmukh on 08/07/25.
//
import Foundation
final class AVLTreeNode<Key: Comparable, Value> {
    var key: Key
    var value: Value
    var height: Int
    var left: AVLTreeNode?
    var right: AVLTreeNode?

    init(key: Key, value: Value, height: Int = 1, left: AVLTreeNode? = nil, right: AVLTreeNode? = nil) {
        self.key = key
        self.value = value
        self.height = height
        self.left = left
        self.right = right
    }
}
