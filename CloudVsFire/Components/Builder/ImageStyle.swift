//
//  ImageStyle.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/16/23.
//

import SwiftUI

/// `ImageStyle` is a protocol that defines a style that can be applied to an `Image` view.
/// Types conforming to `ImageStyle` can control the appearance and interaction of an `Image` view.
/// This protocol is similar to `ButtonStyle`
protocol ImageStyle {
    
    /// The type of view representing the body of this style.
    associatedtype Body: View
    
    /// Creates a view that represents the body of an `Image` view, styled with this style.
    ///
    /// - Parameter configuration: The current image configuration, containing the associated `Image`.
    /// - Returns: A view representing the body of the styled `Image`.
    func makeBody(configuration: Configuration) -> Self.Body
    
    typealias Configuration = ImageStyleConfiguration
}

/// `ImageStyleConfiguration` is a struct that encapsulates the properties of an `Image` view
/// that can be used by an `ImageStyle` to create a custom styled view.
struct ImageStyleConfiguration {
    
    /// The `Image` view that is being styled.
    let image: Image
}
