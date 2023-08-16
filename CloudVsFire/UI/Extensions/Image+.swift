//
//  Image+.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/16/23.
//

import SwiftUI

extension Image {
    
    #if os(macOS)
    init(asset: ImageAsset) {
        guard let uiImage = asset.image else {
            fatalError("Unable to load image asset named \(asset.rawValue).")
        }
        self.init(nsImage: uiImage)
    }
    #elseif os(iOS) || os(tvOS) || os(watchOS)
    init(asset: ImageAsset) {
        self.init(uiImage: asset.image)
    }
    #endif
    
    func imageStyle<S: ImageStyle>(_ style: S) -> some View {
        style.makeBody(configuration: ImageStyleConfiguration(image: self))
    }
}

