//
//  CommentModel.swift
//  FigmaProject
//
//  Created by Владислав Пуцыкович on 7.02.22.
//

import Foundation
import RealmSwift

@objcMembers
class CommentModel: Object {
    dynamic var commentID = UUID().uuidString
    dynamic var date = Date()
    dynamic var user: UserModel? = nil
    dynamic var text = String()
    dynamic var detailText = String()
    dynamic var grade = Float()
    dynamic var product: ProductModel? = nil

    override static func primaryKey() -> String? {
        return #keyPath(commentID)
    }
}
