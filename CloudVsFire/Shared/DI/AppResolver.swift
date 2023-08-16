//
//  AppResolver.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/16/23.
//

import Foundation

final class AppResolver {
    static var sharedServices: AppServices = AppServices()
    
    static func resolve<T>(_ keyPath: KeyPath<AppServices, T>) -> T {
        sharedServices[keyPath: keyPath]
    }
}
