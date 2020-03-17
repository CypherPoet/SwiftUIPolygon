import SwiftUI
import CypherPoetMathUtils_Trig
import Clamping



public struct Polygon {
        
    /// The number of sides belonging to the polygon.
    ///
    /// This value must be greater than or equal to 1.
    /// If a value less than 1 is set, it will be clamped to 1 automatically.
    ///
    /// Polygons with 1 or 2 sides will be rendered as a circle.
    @Clamping(range: 1...Int.max)
    public var sides: Int = 3
    
    /// Default: 1
    public var scale: CGFloat
    
    /// Default: `face`
    public var renderingMode: MeshRenderingMode
    
    /// The number of sides represented with its decimal part
    /// so we can animate any changes between whole-numbers of sides.
    private var sideCountAsFloat: CGFloat
    
    
    public init(
        sides: Int = 3,
        scale: CGFloat = 1,
        renderingMode: MeshRenderingMode = .face
    ) {
        self._sides.wrappedValue = sides
        self.scale = scale
        self.renderingMode = renderingMode
        
        self.sideCountAsFloat = CGFloat(sides)
    }
}


// MARK: - AnimatableData
extension Polygon: Animatable {

    public var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get {
            AnimatablePair(sideCountAsFloat, scale)
        }
        set {
            sideCountAsFloat = sides > 2 ? newValue.first : CGFloat(sides)
            scale = newValue.second
        }
    }
}


// MARK: - Shape
extension Polygon: Shape {

    public func path(in rect: CGRect) -> Path {
        guard sidesToDraw > 2 else { return Circle().path(in: rect) }
        
        let center = self.center(in: rect)
        let hypotenuse = self.hypotenuse(in: rect)
        
        var vertices: [CGPoint] = []
        var path = Path()
        
        for index in (0 ..< sidesToDraw) {
            let angle = Double(index) * Double(2.0 * .pi / sideCountAsFloat)
            let vertex = point(from: center, atDistance: hypotenuse, inDirection: .radians(angle))
            
            if index == 0 {
                // move to the first vertex
                path.move(to: vertex)
            } else {
                // draw a line to the next vertex
                path.addLine(to: vertex)
            }
            
            // Store vertices if we'll need them for wireframe drawing
            if renderingMode == .wireframe { vertices.append(vertex) }
        }
        
        path.closeSubpath()
        
        if renderingMode == .wireframe {
            drawMeshLines(path: &path, vertices: vertices)
        }

        return path
    }
}


// MARK: - Computeds
extension Polygon {

    ///As the decimal part of the newest side grows, this side will go from zero to its full length.
    var sidesToDraw: Int { Int(ceil(sideCountAsFloat)) }


    /// A hypotenuse computed to fit inside the available rect
    func hypotenuse(in rect: CGRect) -> CGFloat {
        (min(rect.size.width, rect.size.height) / 2.0) * scale
    }
    
    
    func center(in rect: CGRect) -> CGPoint {
        CGPoint(x: rect.width / 2, y: rect.height / 2)
    }
}


// MARK: - Private Helpers
extension Polygon {
    
    private func drawMeshLines(
        path: inout Path,
        vertices: [CGPoint],
        startingVertexIndex: Int = 0
    ) {
        let vertexCount = vertices.count
        
        // We need to have a vertex other than the starting point and its
        // adjacent vertex (which is already drawn as the perimeter)
        guard vertexCount - startingVertexIndex > 2 else { return }

        let startingVertex = vertices[startingVertexIndex]
        
        for vertexOffset in 2 ..< vertexCount {
            let targetVertex = vertices[(startingVertexIndex + vertexOffset) % vertexCount]
            
            path.move(to: startingVertex)
            path.addLine(to: targetVertex)
        }
        
        drawMeshLines(path: &path, vertices: vertices, startingVertexIndex: startingVertexIndex + 1)
    }
}
