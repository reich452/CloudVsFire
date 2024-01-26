//
//  RootTab.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 1/23/24.
//

import Foundation
import SFSafeSymbols
import SwiftUI

/// The `RootTab` enum represents the different tabs in your application.
///
///  Each case of this enum corresponds to a specific tab, providing an easy way to identify and navigate between different sections or features of the app.
///  It conforms`CaseIterable`, `Codable`, `Hashable`, and `Identifiable`.
///
///  This adds functionality such as: iterating through cases, encoding/decoding, hash-based data structures, and identifying objects uniquely.
enum RootTab: CaseIterable, Codable, Hashable, Identifiable {
    /// Represents the "Home" tab.
    case home
    /// Represents the "CloudKit" tab.
    case cloudKit
    /// Represents the "Firebase" tab.
    case firebase
    /// Represents the "Settings" tab.
    case settings
    
    var id: RootTab { self }
}

extension RootTab {
    
    @ViewBuilder var label: some View {
        switch self {
        case .home:
            Label("Home", systemSymbol: .house)
        case .cloudKit:
            Label("CloudKit", systemSymbol: .cloud)
        case .firebase:
            Label("Firebase", systemSymbol: .flame)
        case .settings:
            Label("Settings", systemSymbol: .gear)
        }
    }
    
    @ViewBuilder var destination: some View {
        switch self {
        case .home:
            HomeNavigationStack()
        case .cloudKit:
            CloudKitNavigationStack()
        case .firebase:
            FirebaseNavigationStack()
        case .settings:
            SettingsNavigationStack()
        }
    }
}
