import Foundation
import XCTest

@testable import SwiftUIPolygon_Polygon


final class PolygonTests: XCTestCase {
}


// MARK: - Factories for setup
extension PolygonTests {

    func makePolygon() -> Polygon {
        .init()
    }


    func makePolygon(sideCount: Int) -> Polygon {
        .init(sideCount: sideCount)
    }
}


// MARK: - Init
extension PolygonTests {

    func test_init_createPolygonWithDefaultSideCountOfThree() {
        let polygon = Polygon()

        XCTAssertEqual(polygon.sideCount, 3)
    }


    func test_init_createPolygonWithDefaultScaleOfOne() {
        let polygon = Polygon()

        XCTAssertEqual(polygon.scale, 1)
    }


    func test_init_withSideCount_clampsNumberOfSidesToALowerBoundOfOne() {
        var sideCount = 0
        var polygon = makePolygon(sideCount: sideCount)

        XCTAssertEqual(polygon.sideCount, 1)

        sideCount = -10
        polygon = makePolygon(sideCount: sideCount)

        XCTAssertEqual(polygon.sideCount, 1)

        sideCount = 10
        polygon = makePolygon(sideCount: sideCount)

        XCTAssertEqual(polygon.sideCount, 10)
    }
}


// MARK: - Property Access
extension PolygonTests {

    func test_setSideCount_clampsNumberOfSidesToALowerBoundOfOne() {
        var polygon = makePolygon(sideCount: 1)

        XCTAssertEqual(polygon.sideCount, 1)

        polygon.sideCount = -10
        XCTAssertEqual(polygon.sideCount, 1)

        polygon.sideCount = 10

        XCTAssertEqual(polygon.sideCount, 10)
    }
}
