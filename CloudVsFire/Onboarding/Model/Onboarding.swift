//
//  Onboarding.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/16/23.
//

import Foundation

enum Onboarding: CaseIterable {
    
    case pageOne
    case pageTwo
    case pageThree
    
    // MARK: - Computed
    
    var imageAsset: ImageAsset {
        switch self {
            // TODO: - add all image cases
        default:
            return .onboardingIcon1
        }
    }
    
    var title: LocalizedStringResource {
        switch self {
        case .pageOne:
            return LocalizedStringResource("Welcome to Cloud.vs.Fire", table: "Onboarding", comment: "Title")
        case .pageTwo:
            return LocalizedStringResource("CloudKit", table: "Onboarding", comment: "Title")
        case .pageThree:
            return LocalizedStringResource("Firebase", table: "Onboarding", comment: "Title")
        }
    }
    
    var subTitle: LocalizedStringResource {
        switch self {
        case .pageOne:
            return LocalizedStringResource("This app guids you through 2 different backends. If you're here to see the performance diffrence between CloudKit & Firebase. You're in the right spot! This app also has a bonus swiping feature to see the top new movies.", 
                                           table: "Onboarding",
                                           comment: "The apps description")
        case .pageTwo:
            return LocalizedStringResource("See the posts from CloudKit along with the fetching time. Upload your own post to see how long it takes. Or view the discussion boarrd to see what people are saying about CloudKit. Add your own thoughts.", 
                                           table: "Onboarding",
                                           comment: "CloudKit usage description")
        case .pageThree:
            return LocalizedStringResource("Want to see the same app but with Firebase? This app has the same UX but with Firebase. An app within an app. Choose your backend!", 
                                           table: "Onboarding", 
                                           comment: "CloudKit usage description.")
        }
    }
}
