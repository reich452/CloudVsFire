//
//  HomeNavigationStack.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 1/23/24.
//

import SwiftUI

struct HomeNavigationStack: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Home screen TODO")
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeNavigationStack()
}
