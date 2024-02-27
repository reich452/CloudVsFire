//
//  OnboardingView.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/5/23.
//

import SwiftUI

struct OnboardingView: View {

    var body: some View {
        VStack {
            OnboardingHeaderView(image: image)
            Text(title)
                .padding(.top)
                .font(.system(.title2, weight: .semibold))
                .foregroundColor(.black)
            Text(subTitle)
                .font(.subheadline)
                .padding(.bottom)
                .foregroundColor(.black)
                .padding([.horizontal, .top])
        }
        .multilineTextAlignment(.center)
    }
    
    let title: LocalizedStringResource
    let subTitle: LocalizedStringResource
    let image: UIImage
    
    init(title: LocalizedStringResource, subTitle: LocalizedStringResource, image: UIImage) {
        self.title = title
        self.subTitle = subTitle
        self.image = image
    }
    
    init(from onboarding: Onboarding) {
        self.init(title: onboarding.title, subTitle: onboarding.subTitle, image: onboarding.imageAsset.image)
    }
}

#Preview {
    OnboardingView(from: .pageTwo)
}
