//
//  PublisherObservableObject.swift
//  
//
//  Created by Nick Reichard on 1/25/24.
//
import Combine
import Foundation

/// An observable object that subscribes to a publisher and triggers view updates in SwiftUI.
///
/// `PublisherObservableObject` is designed to work with SwiftUI's reactive update mechanism.
/// It subscribes to a given `AnyPublisher` and calls `objectWillChange.send()` whenever the publisher
/// emits a value. This makes it useful for integrating Combine publishers into SwiftUI's view update system.
///
/// - Note: The publisher is expected to emit `Void` values and never fail (i.e., `Never` error type),
///         which aligns with the typical usage of triggering view updates without specific data changes.
///
/// Usage Example:
/// ```
/// @ObservedObject var observer = PublisherObservableObject(
///     publisher: somePublisher
/// )
/// ```
///
/// In the above example, `somePublisher` is a `AnyPublisher<Void, Never>` that, when it emits,
/// will trigger SwiftUI to re-render the views that depend on `observer`.
final class PublisherObservableObject: ObservableObject {

    /// The subscriber that listens to the publisher.
    var subscriber: AnyCancellable?

    /// Initializes a new instance of `PublisherObservableObject`.
    ///
    /// - Parameter publisher: The `AnyPublisher<Void, Never>` to subscribe to. When this publisher emits,
    ///   the `objectWillChange` will be triggered, notifying SwiftUI that this object has been updated.
    public init(publisher: AnyPublisher<Void, Never>) {
        subscriber = publisher.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
}
