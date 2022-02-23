//
//  ProductModel.swift
//  FigmaProject
//
//  Created by Владислав Пуцыкович on 7.02.22.
//

import Foundation
import RealmSwift

@objcMembers
class ProductModel: Object {
    dynamic var productID = UUID().uuidString
    dynamic var name = String()
    dynamic var category: CategoryModel? = nil
    dynamic var picture: Data? = nil
    dynamic var detailInfomation = String()
    dynamic var price = Float()
    dynamic var comments: CommentModel? = nil
    dynamic var grade: Float = 0.0
    dynamic var countOfBuy: Int = 0

    override static func primaryKey() -> String? {
        return #keyPath(productID)
    }
}
