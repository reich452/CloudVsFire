//
//  PrimaryImageStyle.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/16/23.
//

import SwiftUI

struct PrimaryImageStyle: ImageStyle {
    
    func makeBody(configuration: ImageStyleConfiguration) -> some View {
        configuration.image
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipped()
            .mask { RoundedRectangle(cornerRadius: 20, style: .continuous) }
            .padding(.horizontal)
    }
}
