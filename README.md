# demo

This package shows a problem with the Swift Package Manager (`Apple Swift version 5.0.1 (swiftlang-1001.0.82.4 clang-1001.0.46.5`)

This demo application has a folder with the `main.swift` file and a library named `GDUtil` in the Sources directory.

The `GDUtil` library has a dependency on the SwiftGD library (`https://github.com/twostraws/SwiftGD.git`).

The system where this is being tested has run `brew install gd` which is a requirement from SwiftGD.

```bash
.
├── Makefile
├── Package.swift
├── README.md
├── Sources
│   ├── GDUtil
│   │   └── Dimensions.swift
│   └── demo
│       └── main.swift
└── testimage.png
```

This demo application can be built from the CommandLine but cannot be build using the generated `xcodeproj` file.
## What works

Issue the following command:

```bash
make clean test
```

If it all works out you should see something like:

```text
Fetching https://github.com/twostraws/SwiftGD.git
Completed resolution in 1.45s
Cloning https://github.com/twostraws/SwiftGD.git
Resolving https://github.com/twostraws/SwiftGD.git at 2.5.0
swift build
[4/4] Linking ./.build/x86_64-apple-macosx/debug/demo
./.build/debug/demo testimage.png
width=883; height=427
```

This demonstrates that the package compiles.

## What does not work

Issue the following command:

```bash
make clean xcode
```

This should create the following output:

```log
rm -rf .build demo.xcodeproj package.resolved
swift package update
Fetching https://github.com/twostraws/SwiftGD.git
Completed resolution in 1.39s
Cloning https://github.com/twostraws/SwiftGD.git
Resolving https://github.com/twostraws/SwiftGD.git at 2.5.0
swift package generate-xcodeproj
generated: ./demo.xcodeproj
```

Issue the command

```bash
open demo.xcodeproj
``` 

which will open the project in Xcode. 

Then take the following steps:

1. Just to be certain clean the build folder (Product => Clean Build Folder)
2. Build the product (Product => Build)

The compilation fails. The SwiftGD library has an additional dependency which seems not be present in the compilation path although there is no mentioning of import failures.


