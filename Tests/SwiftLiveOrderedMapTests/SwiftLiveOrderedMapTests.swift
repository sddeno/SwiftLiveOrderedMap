import XCTest
@testable import SwiftLiveOrderedMap

final class SwiftLiveOrderedMapTests: XCTestCase {

    func testInsertionAndRetrieval() {
        var map = SwiftLiveOrderedMap<String, Int>()
        map.insert("one", value: 1)
        map.insert("two", value: 2)
        map.insert("three", value: 3)

        XCTAssertEqual(map["one"], 1)
        XCTAssertEqual(map["two"], 2)
        XCTAssertEqual(map["three"], 3)
        XCTAssertEqual(map.count, 3)
    }

    func testOverwriteValue() {
        var map = SwiftLiveOrderedMap<String, Int>()
        map.insert("value", value: 10)
        map.insert("value", value: 20)
        XCTAssertEqual(map["value"], 20)
        XCTAssertEqual(map.count, 1)
    }

//    func testRemoval() {
//        var map = SwiftLiveOrderedMap<String, Int>()
//        map.insert("a", value: 1)
//        map.insert("b", value: 2)
//        map.remove("a")
//        XCTAssertNil(map["a"])
//        XCTAssertEqual(map["b"], 2)
//        XCTAssertEqual(map.count, 1)
//    }
//
//    func testContainsAndClear() {
//        var map = SwiftLiveOrderedMap<String, Int>()
//        map.insert("alpha", value: 100)
//        XCTAssertTrue(map.contains("alpha"))
//        map.clear()
//        XCTAssertEqual(map.count, 0)
//        XCTAssertFalse(map.contains("alpha"))
//    }

    func testOrderIsMaintained() {
        var map = SwiftLiveOrderedMap<Int, String>()
        map.insert(3, value: "C")
        map.insert(1, value: "A")
        map.insert(2, value: "B")

        XCTAssertEqual(map.keys, [1, 2, 3])
        XCTAssertEqual(map.values, ["A", "B", "C"])
    }

    func testValueSemantics_CopyOnWrite() {
        var original = SwiftLiveOrderedMap<String, Int>()
        original.insert("x", value: 5)

        var copy = original
        copy.insert("y", value: 10)

        // Original should remain unchanged
        XCTAssertEqual(original.count, 1)
        XCTAssertEqual(copy.count, 2)
        XCTAssertNil(original["y"])
        XCTAssertEqual(copy["y"], 10)
    }

    func testSubscriptSetAndGet() {
        var map = SwiftLiveOrderedMap<String, Int>()
        map["hello"] = 42
        XCTAssertEqual(map["hello"], 42)
        map["hello"] = nil
        XCTAssertNil(map["hello"])
    }
}
