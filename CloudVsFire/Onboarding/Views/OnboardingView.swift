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
            Image(uiImage: onboarding.imageAsset.image) // assumes ImageAsset is an enum with String raw values
                .imageStyle(PrimaryImageStyle())
                .padding(.bottom)
            Text(onboarding.title)
                .padding(.top)
                .font(.system(.title2, weight: .semibold))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
            Text(onboarding.subTitle)
                .font(.subheadline)
                .padding(.bottom)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding([.horizontal, .top])
        }
    }
    
    var onboarding: Onboarding
    
    init(onboarding page: Onboarding) {
        self.onboarding = page
    }
}

#Preview {
    OnboardingView(onboarding: .pageTwo)
}
