//
//  VerticalSpace.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/16/23.
//

import SwiftUI

struct VerticalSpace: View {
    
    let size: CGFloat
    
    init(_ size: CGFloat) {
        self.size = size
    }
    
    var body: some View {
        Spacer()
            .frame(height: size)
    }
}

struct HorizontalSpace: View {
    
    let size: CGFloat
    
    init(_ size: CGFloat) {
        self.size = size
    }
    
    var body: some View {
        Spacer()
            .frame(width: size)
    }
}
