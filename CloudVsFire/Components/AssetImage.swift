//
//  AssetImage.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/16/23.
//

import SwiftUI

struct AssetImage: View {
    
    let asset: ImageAsset
    
    var body: some View {
        Image(asset.rawValue)
    }
}
