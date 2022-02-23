//
//  LoginService.swift
//  FigmaProject
//
//  Created by Владислав Пуцыкович on 13.02.22.
//

import Foundation
import RealmSwift

class LoginService {
    private let db: DBManager = DBManagerImpl()
    
    func login(loginName: String, password: String) -> Bool {
        let users: [UserModel] = db.obtain()
        guard let user = users.first(where: { $0.login == loginName }) else { return false }
        if user.password == password {
            makeUserIsLogined(user: user)
            return true
        }
        return false
    }
    
    func getAuthUser() -> UserModel? {
        let users: [UserModel] = db.obtain()
        return users.first(where: { $0.isLogined })
    }
    
    func userIsLogined() -> Bool {
        let users: [UserModel] = db.obtain()
        return users.contains(where: { $0.isLogined })
    }
    
    func makeUserIsLogined(user: UserModel) {
        lazy var realm = try! Realm(
            configuration: .defaultConfiguration,
            queue: .none
        )
        try! realm.write {
            user.isLogined = true
        }
    }
}
