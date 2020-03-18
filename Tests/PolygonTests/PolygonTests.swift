import Foundation
import XCTest

@testable import Polygon


final class PolygonTests: XCTestCase {
}


// MARK: - Factories for setup
extension PolygonTests {

    func makePolygon() -> Polygon {
        .init()
    }


    func makePolygon(sides: Int) -> Polygon {
        .init(sides: sides)
    }
}


// MARK: - Init
extension PolygonTests {

    func test_init_createPolygonWithDefaultSidesOfThree() {
        let polygon = Polygon()

        XCTAssertEqual(polygon.sides, 3)
    }


    func test_init_createPolygonWithDefaultScaleOfOne() {
        let polygon = Polygon()

        XCTAssertEqual(polygon.scale, 1)
    }


    func test_init_withSides_clampsNumberOfSidesToALowerBoundOfOne() {
        var sides = 0
        var polygon = makePolygon(sides: sides)

        XCTAssertEqual(polygon.sides, 1)

        sides = -10
        polygon = makePolygon(sides: sides)

        XCTAssertEqual(polygon.sides, 1)

        sides = 10
        polygon = makePolygon(sides: sides)

        XCTAssertEqual(polygon.sides, 10)
    }
}


// MARK: - Property Access
extension PolygonTests {

    func test_setSides_clampsNumberOfSidesToALowerBoundOfOne() {
        var polygon = makePolygon(sides: 1)

        XCTAssertEqual(polygon.sides, 1)

        polygon.sides = -10
        XCTAssertEqual(polygon.sides, 1)

        polygon.sides = 10

        XCTAssertEqual(polygon.sides, 10)
    }
}
