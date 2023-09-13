//
//  OnboardingPageView.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/5/23.
//

import SwiftUI

struct OnboardingPageView: View {
    @Bindable var viewModel: OnboardingPageViewModel
    
    var body: some View {
        VStack {
            TabView(selection: $viewModel.currentPage) {
                ForEach(viewModel.allOnboardingPages.indices, id: \.self) { index in
                    OnboardingView(onboarding: viewModel.allOnboardingPages[index])
                        .tag(index)
                }
            }
            .tabViewStyle(.page)
            .animation(.bouncy, value: 100)
            Button("Next") {
                withAnimation {
                    viewModel.nextPage()
                }
            }
            .disabled(viewModel.isLastPage)
            .padding()
        }
    }
    
    init() {
        self.init(viewModel: OnboardingPageViewModel())
        setupAppearance()
    }
    
    fileprivate init(viewModel: OnboardingPageViewModel) {
        self.viewModel = viewModel
    }
    
    private func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .magenta
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.magenta.withAlphaComponent(0.2)
    }
}

// MARK: - Preview

#Preview {
    OnboardingPageView()
}
