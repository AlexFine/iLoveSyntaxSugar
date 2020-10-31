import SwiftUI


@available(iOS 13.0, *)
public extension UIFont {
    /// Initializes a `UIFont` using the same system initializer syntax availible in `Font` 🔠🔡
        /// - Parameters:
        ///   - size: The font size as a `CGFloat`
        ///   - weight: Font weight from the `UIFont.Weight` types
        ///   - design: Font design from the `UIFontDescriptor.SystemDesign` options
    convenience init? (size: CGFloat = 14, weight: UIFont.Weight = .regular, design: UIFontDescriptor.SystemDesign = .rounded) {
        // Will be SF Compact or standard SF in case of failure.
        // Just pass in proper inputs and this shit won't fail
        if let descriptor = UIFont.systemFont(ofSize: size, weight: weight).fontDescriptor.withDesign(design) {
            self.init(descriptor: descriptor, size: size)
        } else {
            self.init()
        }
    }
}


@available(iOS 13, *)
extension UIColor {
    /// Creates a `UIColor` with SwiftUI's native `Color` 🎨🖍🎨
    /// - Parameter color: The desired text color 🌈
    /// - Returns: A `UIColor` created from the original `Color` 🚦
    class func from(color: Color) -> UIColor {
        if #available(iOS 14, *) {
            return UIColor(color)
        } else {
            let scanner = Scanner(string: color.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
            var hexNumber: UInt64 = 0
            var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
            
            let result = scanner.scanHexInt64(&hexNumber)
            if result {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255
            }
            
            return UIColor(red: r, green: g, blue: b, alpha: a)
        }
    }
}
