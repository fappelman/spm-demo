import Foundation
import GDUtil

let url = URL(fileURLWithPath: CommandLine.arguments[1])
if let dimensions = pngDimensions(fileURL: url) {
    print("width=\(dimensions.width); height=\(dimensions.height)")
} else {
    print("Could not open image")
}
