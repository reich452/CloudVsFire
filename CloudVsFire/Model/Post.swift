//
//  Post.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 2/13/24.
//

import UIKit

protocol Post {
    var recordID: String { get }
    var authorID: String { get }
    var caption: String { get set }
    var creationDate: Date { get set }
    var likes: Int { get set }
    var image: UIImage? { get set }
    var imageStringURL: String { get set }
    
    var comments: [Comment] { get set }
    var dataBase: DataBase { get set }
}

enum DataBase {
    case cloudKit
    case firebase
}
