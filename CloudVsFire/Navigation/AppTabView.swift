//
//  AppTabView.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 1/26/24.
//

import SwiftUI

struct AppTabView: View {
    @Binding var selection: RootTab?
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(RootTab.allCases) { screen in
                screen.destination
                    .tag(screen as RootTab?)
                    .tabItem { screen.label }
            }
        }
    }
}

#Preview {
    AppTabView(selection: .constant(.home))
     
}
