//
//  StoreModel.swift
//  FigmaProject
//
//  Created by Владислав Пуцыкович on 8.02.22.
//

import Foundation

import RealmSwift

@objcMembers
class StoreModel: Object {
    dynamic var storeID = UUID().uuidString
    dynamic var name = String()
    dynamic var number = String()
    dynamic var laditude = Double()
    dynamic var longitude = Double()

    override static func primaryKey() -> String? {
        return #keyPath(storeID)
    }
}
