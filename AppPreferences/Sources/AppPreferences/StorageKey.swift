//
//  StorageKey.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 1/25/24.
//

import Foundation

public protocol StorageKey {
    var key: String { get }
}

extension StorageKey where Self: RawRepresentable, RawValue == String {
    public var key: String { rawValue }
}
