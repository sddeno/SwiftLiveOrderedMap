# SwiftLiveOrderedMap

`SwiftLiveOrderedMap` is a high-performance, value-semantic, ordered key-value map for Swift — implemented from scratch using an AVL Tree under the hood. It maintains the **insertion order** of keys while supporting **fast lookups**, **removals**, and **ordered iteration**.

This package is the key-value counterpart to [SwiftLiveOrderedSet](https://github.com/sddeno/SwiftLiveOrderedSet), built with the same principles of correctness, efficiency, and expressive Swift API design.

---

## 🔧 Features

- ✅ Value semantics with **Copy-on-Write**
- ✅ Efficient `insert`, `remove`, `update`, and `lookup` operations
- ✅ Maintains **insertion order**
- ✅ Conforms to `Collection`, `Equatable`, `CustomStringConvertible`, and more
- ✅ Fully tested with edge cases and mutability checks

---

## 📦 Installation

Use the **Swift Package Manager** to add it to your project:


![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)
![Platform](https://img.shields.io/badge/platform-macos%20%7C%20ios%20%7C%20watchos%20%7C%20tvos-lightgrey)
![License](https://img.shields.io/github/license/sddeno/SwiftLiveOrderedMap)

var map = SwiftLiveOrderedMap<String, Int>()
map["apple"] = 10
map["banana"] = 20
print(map["apple"]) // Optional(10)
print(map.count)    // 2


[![Swift Package Manager](https://img.shields.io/badge/SPM-compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager/)
