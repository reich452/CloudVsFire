//
//  CloudKitNavigationStack.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 1/23/24.
//

import SwiftUI

struct CloudKitNavigationStack: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("CloudKit layout")
            }
            .navigationTitle("CloudKit")
        }
    }
}

#Preview {
    CloudKitNavigationStack()
}
