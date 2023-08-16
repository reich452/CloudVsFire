//
//  OnboardingPageProviding.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/16/23.
//

import Foundation

protocol OnboardingPageProvider: Service {
    func getOnboardingPages() -> [Onboarding]
}

struct OnboardingPageProviding: OnboardingPageProvider {
    
    private(set) var title: String = ""
    private(set) var subTitle: String = ""
    private(set) var imageAsset: ImageAsset = .onboardingIcon1
    
    func setTitle(_ title: String) -> OnboardingPageProviding {
        return OnboardingPageProviding(title: title, subTitle: self.subTitle, imageAsset: self.imageAsset)
    }
    
    func setSubTitle(_ subTitle: String) -> OnboardingPageProviding {
        return OnboardingPageProviding(title: self.title, subTitle: subTitle, imageAsset: self.imageAsset)
    }
    
    func setImageAsset(_ imageAsset: ImageAsset) -> OnboardingPageProviding {
        return OnboardingPageProviding(title: self.title, subTitle: self.subTitle, imageAsset: imageAsset)
    }
    
    func build() -> Onboarding {
        return Onboarding(title: title, subTitle: subTitle, imageAsset: imageAsset)
    }
    
    func createOnboarding(_ configure: (OnboardingPageProviding) -> OnboardingPageProviding) -> Onboarding {
        return configure(self).build()
    }
    
    
    func getOnboardingPages() -> [Onboarding] {
        let onboarding1 = createOnboarding { builder in
            builder
                .setTitle("Welcome")
                .setSubTitle("Welcome to the App")
                .setImageAsset(.onboardingIcon1)
        }
        
        let onboarding2 = createOnboarding { builder in
            builder
                .setTitle("Feature 1")
                .setSubTitle("This is feature 1")
                .setImageAsset(.onboardingIcon1)
        }
        
        let onboarding3 = createOnboarding { builder in
            builder
                .setTitle("Feature 2")
                .setSubTitle("This is feature 2")
                .setImageAsset(.onboardingIcon1)
        }
        
        return [onboarding1, onboarding2, onboarding3]
    }
}
