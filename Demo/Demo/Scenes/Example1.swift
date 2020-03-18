//
//  Example1.swift
//  Demo
//
//  Created by CypherPoet on 3/14/20.
// ✌️
//

import SwiftUI
import Polygon


struct Example1 {

    private let sideCountRange: ClosedRange<CGFloat> = ClosedRange(uncheckedBounds: (lower: 0, upper: 30))
    private let scaleRange: ClosedRange<CGFloat> = ClosedRange(uncheckedBounds: (lower: 0.1, upper: 4))
    private let strokeWidthRange: ClosedRange<CGFloat> = ClosedRange(uncheckedBounds: (lower: 1, upper: 14))

    @State private var sideCount: CGFloat = 2
    @State private var scale: CGFloat = 1.0
    @State private var strokeWidth: CGFloat = 2
    @State private var meshRenderingMode: Polygon.MeshRenderingMode = .face
    @State private var isShapeFilled = false
}


// MARK: - View
extension Example1: View {

    var body: some View {
        List {
            Section {
                polygonShape
                    .fill(isShapeFilled ? Color.orange : Color.clear)
                    .overlay(
                        polygonShape
                            .stroke(Color.purple, lineWidth: strokeWidth)
                    )
                    .scaleEffect(scale)
                    .animation(.easeOut(duration: 0.3))
                    .padding()

            }
            .frame(height: 400)
            .clipped()

            controls
        }
        .listRowInsets(.init(top: 12, leading: 24, bottom: 12, trailing: 24))
        .background(Color.gray)
        .navigationBarTitle("", displayMode: .inline)
    }
}


// MARK: - Computeds
extension Example1 {
}


// MARK: - View Variables
extension Example1 {

    private var polygonShape: some Shape {
        Polygon(
            sides: Int(sideCount),
            renderingMode: meshRenderingMode
        )
    }

    
    private var controls: some View {
        Group {
            Section(header: Text("")) {
                VStack {
                    Text("Side Count: \(Int(sideCount))")
                        .font(.headline)

                    Slider(
                        value: $sideCount,
                        in: sideCountRange,
                        step: 1,
                        minimumValueLabel: Text("\(Int(sideCountRange.lowerBound))"),
                        maximumValueLabel: Text("\(Int(sideCountRange.upperBound))")
                    ) {
                        Text("Side Count")
                    }
                }


                VStack {
                    Text("Scale: \(NumberFormatters.decimalDisplayFormatter.string(for: scale) ?? "")")
                        .font(.headline)

                    Slider(
                        value: $scale,
                        in: scaleRange,
                        step: 0.1,
                        minimumValueLabel: Text(
                            "\(NumberFormatters.decimalDisplayFormatter.string(for: scaleRange.lowerBound) ?? "")"
                        ),
                        maximumValueLabel: Text(
                            "\(NumberFormatters.decimalDisplayFormatter.string(for: scaleRange.upperBound) ?? "")"
                        )
                    ) { Text("Scale") }
                }


                VStack {
                    Text("Stroke Width: \(Int(strokeWidth))")
                        .font(.headline)

                    Slider(
                        value: $strokeWidth,
                        in: strokeWidthRange,
                        step: 0.1,
                        minimumValueLabel: Text(
                            "\(NumberFormatters.decimalDisplayFormatter.string(for: strokeWidthRange.lowerBound) ?? "")"
                        ),
                        maximumValueLabel: Text(
                            "\(NumberFormatters.decimalDisplayFormatter.string(for: strokeWidthRange.upperBound) ?? "")"
                        )
                    ) { Text("Stroke Width") }
                }
            }

            Section(header: Text("")) {
                HStack {
                    Spacer()
                    Picker(selection: $meshRenderingMode, label: Text("Rendering Mode")) {
                        ForEach(Polygon.MeshRenderingMode.allCases) { renderingMode in
                            Text(renderingMode.displayText).tag(renderingMode)
                        }
                    }
                    Spacer()
                }
                
                Toggle(isOn: $isShapeFilled) {
                    Text("Fill Shape")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}


// MARK: - Private Helpers
private extension Example1 {
}



// MARK: - Preview
struct Example1_Previews: PreviewProvider {

    static var previews: some View {
        Example1()
    }
}
