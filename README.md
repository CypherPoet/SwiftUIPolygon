# SwiftUIPolygon

<p align="center">
   <img width="600px" src="./Assets/Logo/Exports/logo.png" alt="SwiftUIPolygon Header Logo">
</p>


<p align="center">
    <img src="https://img.shields.io/badge/Swift-5.1-F06C33.svg" />
    <img src="https://img.shields.io/badge/iOS-13.0+-865EFC.svg" />
    <img src="https://img.shields.io/badge/iPadOS-13.0+-F65EFC.svg" />
    <img src="https://img.shields.io/badge/macOS-10.15+-179AC8.svg" />
    <img src="https://img.shields.io/badge/tvOS-13.0+-41465B.svg" />
    <img src="https://img.shields.io/badge/watchOS-6.0+-1FD67A.svg" />
    <a href="https://github.com/apple/swift-package-manager">
      <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" />
    </a>
    <a href="https://twitter.com/cypher_poet">
        <img src="https://img.shields.io/badge/Contact-@cypher_poet-lightgrey.svg?style=flat" alt="Twitter: @cypher_poet" />
    </a>
</p>

<br/>

<p align="center">

  _An animatable SwiftUI Polygon Shape with support for mesh rendering._

</p>

<br/>

<p align="center">
   <img src="./Assets/Screenshots/demo-1.gif" width="400px" alt="Demo">

   <div>

   - 🔗Clone or download this repo and play around with the [Demo app](./Demo/).

   </div>
</p>

<br/>

<p align="center">

  SwiftUIPolygon aims to provide a primitive `Shape` implementation that can be rendered as any n-sided polygon in its regular form -- with support for animating side-count changes in real time. As bonus, you can configure it to render just the face -- or render the inner edges for a "wireframe" effect.

</p>



## Features

- [x] Shape animation support for side counts.
- [x] Mesh Rendering
- [x] Configurable side counts and rendering modes.


## Requirements

- iOS 13.0+
- iPadOS 13.0+
- macOS 10.15+
- tvOS 13.0+
- watchOS 6.0+
- Xcode 11.3+ (for developing)



## Installation

### Xcode Projects

Using Xcode, select `File` -> `Swift Packages` -> `Add Package Dependency` and enter https://github.com/CypherPoet/SwiftUIPolygon.

### Swift Package Manager

`SwiftUIPolygon` can be used through the Swift Package Manager. You can add it as a dependency in your `Package.swift` file:

```swift
let package = Package(
    //...
    dependencies: [
        .package(url: "https://github.com/CypherPoet/SwiftUIPolygon", from: "0.1.0"),
    ],
    //...
)
```

From there, you can `import SwiftUIPolygon` wherever you'd like to use it.


## Usage

```swift
Polygon(
    sides: 8,
    renderingMode: .wireframe
)
```

### Configurable Properties

#### sides (`Int`)

The number of sides belonging to the polygon.

This value must be greater than or equal to 1.
If a value less than 1 is set, it will be clamped to 1 automatically.

> Polygons with 1 or 2 sides will be rendered as a circle.

- **default**: 3


#### renderingMode (`Polygon.MeshRenderingMode`)

An enum type of either `face` or `wireframe`.

- **default**: face


### Recipes

#### Stroking and filling the same shape

```swift
Polygon(sides: 5)
    .fill(Color.orange)
    .overlay(
        polygonShape
            .stroke(Color.purple, lineWidth: 8)
    )
```

<p align="center">
   <img src="./Assets/Screenshots/stroke-and-fill.png" width="400px" alt="Stroke & Fill">
</p>



## Roadmap

- [Vertex Rendering Mode](https://en.wikipedia.org/wiki/Polygon_mesh#/media/File:Mesh_overview.svg) (?)


## Contributing

Contributions to `SwiftUIPolygon` are most welcome. Check out some of the [issue templates](./.github/ISSUE_TEMPLATE/) for more info.


## Developing

### Generating Documentation

Documentation is generated by [Jazzy](https://github.com/realm/jazzy). Installation instructions can be found [here](https://github.com/realm/jazzy#installation), and as soon as you have it set up, docs can be generated simply by running `jazzy` from the command line.



## License

SwiftUIPolygon is available under the MIT license. See the [LICENSE file](./LICENSE) for more info.
