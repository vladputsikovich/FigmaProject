//
//  CategoryModel.swift
//  FigmaProject
//
//  Created by Владислав Пуцыкович on 7.02.22.
//

import Foundation
import RealmSwift

@objcMembers
class CategoryModel: Object {
    dynamic var categoryID = UUID().uuidString
    dynamic var name = String()

    override static func primaryKey() -> String? {
        return #keyPath(categoryID)
    }
}
