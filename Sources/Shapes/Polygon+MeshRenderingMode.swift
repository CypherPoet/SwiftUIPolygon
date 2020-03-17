import Foundation

extension Polygon {
    
    public enum MeshRenderingMode: String {
        
        /// Draws only the edges that comprise the outer contour of the shape, thus rendering the "face".
        case face
        
        /// Draws all edges that connect each vertex of the polygon's inner triangles.
        ///
        /// [🔗 More Info](https://en.wikipedia.org/wiki/Wire-frame_model)
        case wireframe
    }
}


extension Polygon.MeshRenderingMode: CaseIterable {}

extension Polygon.MeshRenderingMode: Identifiable {
    public var id: String { rawValue }
}

// MARK: - Computeds
extension Polygon.MeshRenderingMode {
        
    public var displayText: String {
        switch self {
        case .face:
            return "Face"
        case .wireframe:
            return "Wireframe"
        }
    }
}
