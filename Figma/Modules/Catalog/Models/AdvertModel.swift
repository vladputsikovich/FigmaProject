//
//  AdvertModel.swift
//  FigmaProject
//
//  Created by Владислав Пуцыкович on 10.02.22.
//

import Foundation
import RealmSwift

@objcMembers
class AdvertModel: Object {
    dynamic var advertID = UUID().uuidString
    dynamic var title = String()
    dynamic var picture: Data? = nil

    override static func primaryKey() -> String? {
        return #keyPath(advertID)
    }
}
