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

```swift
.package(url: "https://github.com/sddeno/SwiftLiveOrderedMap.git", from: "1.0.0")

