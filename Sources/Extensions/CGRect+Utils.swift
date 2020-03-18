import SwiftUI


extension CGRect {
    var center: CGPoint {
        .init(x: self.width / 2, y: self.height / 2)
    }
}
