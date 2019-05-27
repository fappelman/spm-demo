import Foundation
import SwiftGD

public func pngDimensions(fileURL: URL) -> (width: Int, height: Int)? {
    let type: ImportableFormat = .png

    if let data = try? Data(contentsOf: fileURL),
        let image = try? Image(data: data, as: type) {
        let width = image.size.width
        let height = image.size.height
        return (width: width, height: height)
    } else {
        return nil
    }
}
