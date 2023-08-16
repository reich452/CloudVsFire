//
//  Service.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/16/23.
//

import Foundation

/// A protocol that serves as a marker for services that can be resolved by the `Resolver`.
///
/// By conforming to this protocol, a class or struct indicates that it can be registered
/// with a `Resolver` and later retrieved from that `Resolver`. This protocol is intentionally
/// left empty; it serves as a type constraint to ensure that only intended types (i.e., services)
/// are registered and resolved.
///
/// Example:
///
///     struct ThemeService: Service {
///         // Implementation of ThemeService
///     }
///
///     class UserSettingsService: Service {
///         // Implementation of UserSettingsService
///     }
///
/// Usage:
///
///     let themeService: ThemeService = ResolverContainer.shared.resolve(ThemeService.self)
///     let userSettingsService: UserSettingsService = ResolverContainer.shared.resolve(UserSettingsService.self)
protocol Service {
    // No opt.
}
