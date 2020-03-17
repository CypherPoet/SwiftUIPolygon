# SwiftUIPolygon

<p>
    <img src="https://img.shields.io/badge/Swift-5.1-F06C33.svg" />
    <img src="https://img.shields.io/badge/iOS-13.0+-865EFC.svg" />
    <img src="https://img.shields.io/badge/iPadOS-13.0+-F65EFC.svg" />
    <img src="https://img.shields.io/badge/macOS-10.15+-472C9C.svg" />
    <img src="https://img.shields.io/badge/tvOS-13.0+-41465B.svg" />
    <img src="https://img.shields.io/badge/License-MIT-blue.svg" />
    <a href="https://github.com/apple/swift-package-manager">
      <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" />
    </a>
    <a href="https://twitter.com/cypher_poet">
        <img src="https://img.shields.io/badge/Contact-@cypher_poet-lightgrey.svg?style=flat" alt="Twitter: @cypher_poet" />
    </a>
</p>


<p align="center">

_An animatable SwiftUI Polygon Shape with support for mesh rendering._

<p />

<!--

[[ Header Screenshot ]]
![](/Assets/Screenshots/header.png)

 -->


## Features

- [x] Shape animation support for scale and side count.
- [x] Mesh Rendering
- [x] Configurable side counts, scale, and rendering modes.



## Requirements

- iOS 13.0+
- iPadOS 13.0+
- macOS 10.15+
- tvOS 13.0+
- 
- Xcode 11.3+ (for developing)



## Installation

`SwiftUIPolygon` can be used through the Swift Package Manager. You can add it as a dependency in your `Package.swift` file:

```swift
let package = Package(
    //...
    dependencies: [
        .package(url: "https://github.com/CypherPoet/SwiftUIPolygon", "0.1.0"),
    ],
    //...
)
```

From there, you can `import Polygon` wherever you'd like to use it.


## Roadmap

- [Vertex Rendering Mode](https://en.wikipedia.org/wiki/Polygon_mesh#/media/File:Mesh_overview.svg) (?)


## Contributing

Contributions to `SwiftUIPolygon` are most welcome. Check out some of the [issue templates](./.github/ISSUE_TEMPLATE/) for more info.




## License

SwiftUIPolygon is available under the MIT license. See the [LICENSE file](./LICENSE) for more info.
