//
//  AVLTree.swift
//
//
//  Created by Shubham Deshmukh on 08/07/25.
//
import Foundation
final class AVLTree<Key: Comparable, Value> {
    var root: AVLTreeNode<Key, Value>?
    var count: Int = 0

    func height(_ node: AVLTreeNode<Key, Value>?) -> Int {
        node?.height ?? 0
    }

    func balanceFactor(_ node: AVLTreeNode<Key, Value>?) -> Int {
        height(node?.left) - height(node?.right)
    }

    func updateHeight(_ node: AVLTreeNode<Key, Value>) {
        node.height = 1 + max(height(node.left), height(node.right))
    }

    func rotateRight(_ y: AVLTreeNode<Key, Value>) -> AVLTreeNode<Key, Value> {
        let x = y.left!
        y.left = x.right
        x.right = y
        updateHeight(y)
        updateHeight(x)
        return x
    }

    func rotateLeft(_ x: AVLTreeNode<Key, Value>) -> AVLTreeNode<Key, Value> {
        let y = x.right!
        x.right = y.left
        y.left = x
        updateHeight(x)
        updateHeight(y)
        return y
    }

    func balance(_ node: AVLTreeNode<Key, Value>) -> AVLTreeNode<Key, Value> {
        updateHeight(node)
        let balance = balanceFactor(node)

        if balance > 1 {
            if balanceFactor(node.left) < 0 {
                node.left = rotateLeft(node.left!)
            }
            return rotateRight(node)
        }

        if balance < -1 {
            if balanceFactor(node.right) > 0 {
                node.right = rotateRight(node.right!)
            }
            return rotateLeft(node)
        }

        return node
    }

    func insert(key: Key, value: Value) {
        root = insertNode(root, key, value)
    }
    
    @discardableResult
    func minValueNode(_ node: AVLTreeNode<Key, Value>?) -> AVLTreeNode<Key, Value>? {
        var current = node
        while let next = current?.left {
            current = next
        }
        return current
    }


    private func insertNode(_ node: AVLTreeNode<Key, Value>?, _ key: Key, _ value: Value) -> AVLTreeNode<Key, Value> {
        guard let node = node else {
            count += 1
            return AVLTreeNode(key: key, value: value)
        }

        if key < node.key {
            node.left = insertNode(node.left, key, value)
        } else if key > node.key {
            node.right = insertNode(node.right, key, value)
        } else {
            node.value = value
            return node
        }

        return balance(node)
    }

    func delete(_ key: Key) {
        root = deleteNode(root, key)
    }

    private func deleteNode(_ node: AVLTreeNode<Key, Value>?, _ key: Key) -> AVLTreeNode<Key, Value>? {
        guard let node = node else { return nil }

        if key < node.key {
            node.left = deleteNode(node.left, key)
        } else if key > node.key {
            node.right = deleteNode(node.right, key)
        } else {
            count -= 1
            if node.left == nil { return node.right }
            if node.right == nil { return node.left }

            guard let minLargerNode = minValueNode(node.right) else {
                return node
            }
            node.key = minLargerNode.key
            node.value = minLargerNode.value
            node.right = deleteNode(node.right, minLargerNode.key)

        }

        return balance(node)
    }

    func search(_ key: Key) -> AVLTreeNode<Key, Value>? {
        var current = root
        while let node = current {
            if key < node.key {
                current = node.left
            } else if key > node.key {
                current = node.right
            } else {
                return node
            }
        }
        return nil
    }

    func inOrderTraversal() -> [AVLTreeNode<Key, Value>] {
        var result: [AVLTreeNode<Key, Value>] = []
        inOrderTraversal(node: root, result: &result)
        return result
    }

    private func inOrderTraversal(node: AVLTreeNode<Key, Value>?, result: inout [AVLTreeNode<Key, Value>]) {
        guard let node = node else { return }
        inOrderTraversal(node: node.left, result: &result)
        result.append(node)
        inOrderTraversal(node: node.right, result: &result)
    }

    func copyTree() -> AVLTreeNode<Key, Value>? {
        copySubtree(root)
    }

    private func copySubtree(_ node: AVLTreeNode<Key, Value>?) -> AVLTreeNode<Key, Value>? {
        guard let node = node else { return nil }
        let newNode = AVLTreeNode(key: node.key, value: node.value)
        newNode.left = copySubtree(node.left)
        newNode.right = copySubtree(node.right)
        newNode.height = node.height
        return newNode
    }
}
