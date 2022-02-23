//
//  User.swift
//  FigmaProject
//
//  Created by Владислав Пуцыкович on 6.02.22.
//

import Foundation
import RealmSwift

@objcMembers
class UserModel: Object {
    dynamic var userID = UUID().uuidString
    dynamic var picture: Data? = nil 
    dynamic var name = String()
    dynamic var female = String()
    dynamic var sex = String()
    dynamic var dateOfBirth = String()
    dynamic var email = String()
    dynamic var phoneNumber = String()
    dynamic var login = String()
    dynamic var password = String()
    dynamic var isLogined = Bool()

    override static func primaryKey() -> String? {
        return #keyPath(userID)
    }
}
