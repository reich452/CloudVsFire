//
//  Comment.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 2/13/24.
//

import Foundation

protocol Comment {
    var recordID: String { get set }
    var text: String { get set }
    var authorReference: String { get set }
    var creationDate: Date { get set }
    var post: Post? { get set }
}
