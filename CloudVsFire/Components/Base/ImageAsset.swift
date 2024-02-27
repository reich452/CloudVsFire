//
//  ImageAsset.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/16/23.
//

import SwiftUI

/// `ImageAsset` is an enum representation for image assets.
/// Each case of the enum represents a different image asset in a type-safe manner.
/// It helps in avoiding string-based API and reduces mistakes while accessing images.
enum ImageAsset: String {
    case onboardingIcon1
    
    #if os(macOS)
    internal typealias Image = NSImage
    #elseif os(iOS) || os(tvOS) || os(watchOS)
    internal typealias Image = UIImage
    #endif
    
    // MARK: Computed
    
    var image: Image {
        #if os(iOS) || os(tvOS)
        let image = Image(named: self.rawValue, in: .main, compatibleWith: self.traitCollection)
        #elseif os(macOS)
        let name = NSImage.Name(self.rawValue)
        let image = NSImage(named: name)
        #elseif os(watchOS)
        let image = Image(named: self.rawValue)
        #endif
        guard let result = image else {
            fatalError("Unable to load image asset named \(self.rawValue).")
        }
        return result
    }
    
    var traitCollection: UITraitCollection? {
        nil
    }
}

// MARK: - Extension

extension ImageAsset.Image {

#if !os(macOS)
    /// Convenience initializer to create a platform-specific Image instance associated with a given `ImageAsset`.
    ///
    /// - Parameter asset: An `ImageAsset` case representing the desired image.
    /// - Returns: An optional instance of the platform-specific Image. Returns `nil` if the image couldn't be initialized.
    convenience init?(asset: ImageAsset, compatiableWith traitCollection: UITraitCollection? = nil) {
        #if os(iOS) || os(tvOS)
        self.init(named: asset.rawValue, in: .main, compatibleWith: traitCollection)
        #elseif os(watchOS)
        self.init(named: asset.rawValue)
        #endif
    }
#endif
    
}
