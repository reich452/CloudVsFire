//
//  PublisherObservableObject.swift
//  
//
//  Created by Nick Reichard on 1/25/24.
//
import Combine
import Foundation

final class PublisherObservableObject: ObservableObject {

    var subscriber: AnyCancellable?

    public init(publisher: AnyPublisher<Void, Never>) {
        subscriber = publisher.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
}
