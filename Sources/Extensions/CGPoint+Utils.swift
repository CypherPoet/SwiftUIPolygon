import SwiftUI


extension CGPoint {

    func endpoint(
        atDistance distance: CGFloat,
        inDirection direction: Angle
    ) -> CGPoint {
        let radians = direction.radians
        
        return CGPoint(
            x: x + (CGFloat(cos(radians)) * distance),
            y: y + (CGFloat(sin(radians)) * distance)
        )
    }
}
