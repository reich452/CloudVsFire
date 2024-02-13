//
//  OnboardingHeaderView.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 1/30/24.
//

import SwiftUI

struct OnboardingHeaderView: View {
    let image: UIImage
    
    var body: some View {
        Image(uiImage: image) // assumes ImageAsset is an enum with String raw values
            .imageStyle(PrimaryImageStyle())
            .padding(.bottom)
    }
    
    init(image: UIImage) {
        self.image = image
    }
}

#Preview {
    OnboardingHeaderView(image: ImageAsset.Image.onboardingIcon1 ?? UIImage(systemSymbol: .ladybug))
}
