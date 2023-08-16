//
//  OnboardingView.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/5/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var viewModel: OnboardingViewModel
    
    var body: some View {
        
        Image(asset: viewModel.$onboardingPages[)
            .imageStyle(PrimaryImageStyle())
            .padding(.bottom, 60)
        Text(page.title)
            .font(.system(.title2, weight: .semibold))
            .foregroundColor(.black)
            .multilineTextAlignment(.center)
        Text(page.subTitle)
            .font(.subheadline)
            .padding(.bottom)
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .padding(1)
        
    }
        .padding()
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

struct OnboardingView1: View {
    var body: some View {
        // Your content for the first page
        Text("Page 1")
            .font(.largeTitle)
    }
}

struct Onboardingiew2: View {
    var body: some View {
        // Your content for the second page
        Text("Page 2")
            .font(.largeTitle)
    }
}

struct OnboardingView3: View {
    var body: some View {
        // Your content for the third page
        Text("Page 3")
            .font(.largeTitle)
    }
    
    
}
