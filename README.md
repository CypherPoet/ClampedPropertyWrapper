# Clamped: A Swift Property Wrapper

<!-- Header Logo -->

<!-- <div align="center">
   <img width="600px" src="./Extras/banner-logo.png" alt="Banner Logo">
</div> -->


<!-- Badges -->

<p>
    <img src="https://img.shields.io/badge/iOS-13.0+-865EFC.svg" />
    <img src="https://img.shields.io/badge/iPadOS-13.0+-F65EFC.svg" />
    <img src="https://img.shields.io/badge/macOS-10.15+-179AC8.svg" />
    <img src="https://img.shields.io/badge/tvOS-13.0+-41465B.svg" />
    <img src="https://img.shields.io/badge/watchOS-6.0+-1FD67A.svg" />
    <img src="https://img.shields.io/badge/License-MIT-blue.svg" />
    <img src="https://github.com/CypherPoet/ClampedPropertyWrapper/workflows/Build%20&%20Test/badge.svg" />
    <a href="https://github.com/apple/swift-package-manager">
      <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" />
    </a>
    <a href="https://twitter.com/cypher_poet">
        <img src="https://img.shields.io/badge/Contact-@cypher_poet-lightgrey.svg?style=flat" alt="Twitter: @cypher_poet" />
    </a>
</p>


<p align="center">

_A [Swift Property Wrapper](https://docs.swift.org/swift-book/LanguageGuide/Properties.html#ID617) for automatically clamping Comparable values to closed or partial ranges._

<p />


## Features

- ✅ Clamp any `Comparable` type to a `ClosedRange` or a "Half-Open" range.
- ✅ Additional support for initializing clamped `FloatingPoint` properties with a `PartialRangeThrough`, `PartialRangeFrom`, or `PartialRangeUpTo` expression.
- ✅ Initialize clamped `FloatingPoint` or `FixedWidthInteger` properties with _exclusive_ lower and upper bounds.

## Installation

### Xcode Projects

Select `File` -> `Swift Packages` -> `Add Package Dependency` and enter `https://github.com/CypherPoet/ClampedPropertyWrapper`.


### Swift Package Manager Projects

You can add `ClampedPropertyWrapper` as a package dependency in your `Package.swift` file:

```swift
let package = Package(
    //...
    dependencies: [
        .package(url: "https://github.com/CypherPoet/ClampedPropertyWrapper", .upToNextMinor(from: "0.2.0")),
    ],
    //...
)
```

From there, refer to `ClampedPropertyWrapper` as a "target dependency" in any of _your_ package's targets that need it.

```swift
targets: [
    .target(
        name: "YourLibrary",
        dependencies: [
          "ClampedPropertyWrapper",
        ],
        ...
    ),
    ...
]
```

Then simply `import ClampedPropertyWrapper` wherever you’d like to use it.


## Usage

**Basic Example**:

```swift
import ClampedPropertyWrapper

struct Player {

    @Clamped(
        above: 0.0.nextDown,
        andBelow: .infinity
    )
    var xp: Double = 0.0


    @Clamped(to: 1..<100)
    var level: Int = 1


    @Clamped(above: 0.0, andBelow: Double.infinity)
    var number: Double = 1.0


    @Clamped(to: "A"..."Z")
    var firstInitial: Character = "A"


    @Clamped(to: 0.0...)
    var ammo: Double = 0.1


    @Clamped(to: ...100.0)
    var reputation: Double = .zero


    @Clamped(to: ..<20)
    var weeklyLeaderboardRankChange: Int = .zero
}
```

**You can also take things further in [this project's Xcode Playground](./Examples/Playgrounds/)**:

![Playground Example](./Extras/playground-example-1.png)

## Contributing

Contributions to `ClampedPropertyWrapper` are most welcome. Check out some of the [issue templates](./.github/ISSUE_TEMPLATE/) for more info.



## 💻 Developing

### Requirements

- Xcode 12.5+ (Recommended)


### 📜 Generating Documentation

Documentation is generated by [Swift Doc](https://github.com/SwiftDocOrg/swift-doc). Installation instructions can be found [here](https://github.com/SwiftDocOrg/swift-doc#installation), and as soon as you have it set up, docs can be generated simply by running `./Scripts/generate-html-docs.zsh` from the command line.

📝 Note that this will only generate a `.build/documentation` folder for you to view locally. This folder is being ignored by `git`, and a GitHub [action](./.github/workflows/PublishDocumentation.yml) exists to automatically generate docs at the root level and serve them on the project's `gh-pages` branch.


## 🏷 License

`ClampedPropertyWrapper` is available under the MIT license. See the [LICENSE file](./LICENSE) for more info.
