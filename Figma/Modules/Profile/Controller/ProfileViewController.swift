//
//  ProfileViewController.swift
//  FigmaProject
//
//  Created by Владислав Пуцыкович on 6.02.22.
//

import Foundation
import UIKit
import SnapKit

// MARK: Enum all info fields

enum InfoFields {
    case name(String)
    case female(String)
    case sex(String)
    case birth(String)
    case number(String)
    case email(String)
    
    var title: String {
        switch self {
        case .name:
            return "Имя"
        case .female:
            return "Фамилия"
        case .sex:
            return "Пол"
        case .birth:
            return "Дата рождения"
        case .number:
            return "Номер телефона"
        case .email:
            return "Email"
        }
    }
    
    var value: String {
        switch self {
        case .name(let name):
            return name
        case .female(let female):
            return female
        case .sex(let sex):
            return sex
        case .birth(let birth):
            return birth
        case .number(let number):
            return number
        case .email(let email):
            return email
        }
    }
}

// MARK: Constants

fileprivate struct Constants {
    static let cellIdentificator = "cell"
    static let logOutButtonTitle = "Выйти" 
}

class ProfileViewController: UIViewController {
    
    // MARK: Property
    
    private let userImage = UIImageView()
    private let userName = UILabel()
    private let userInfoTableView = UITableView()
    private let logOutButton = UIButton()
    
    private var user = LoginService().getAuthUser() {
        didSet {
            userInfoTableView.reloadData()
        }
    }
    
    //MARK: APP lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createUserImageView()
        createUserNameLabel()
        createUserInfoTableView()
        createLogOutButton()
    }
    
    // MARK: Func to create views
    
    private func createUserImageView() {
        view.addSubview(userImage)
        if user?.picture != nil {
            userImage.image = UIImage(named: "man")
        } else {
            userImage.image = UIImage(named: "user")
        }
        userImage.contentMode = .scaleAspectFill
        userImage.layer.cornerRadius = view.frame.width / 6
        userImage.clipsToBounds = true
        
        userImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(view.frame.width / 5)
            make.width.equalTo(view.frame.width / 3)
            make.height.equalTo(view.frame.width / 3)
            make.centerX.equalTo(view)
        }
    }
    
    private func createUserNameLabel() {
        view.addSubview(userName)
        userName.text = "\(user?.name ?? "") \(user?.female ?? "")"
        userName.font = .systemFont(ofSize: 20)
        userName.textAlignment = .center
        
        userName.snp.makeConstraints { make in
            make.top.equalTo(userImage).inset(view.frame.width / 2.5)
            make.centerX.equalTo(view)
        }
    }
    
    private func createUserInfoTableView() {
        view.addSubview(userInfoTableView)
        userInfoTableView.delegate = self
        userInfoTableView.dataSource = self
        userInfoTableView.isScrollEnabled = false
        userInfoTableView.register(UserInfoCell.self, forCellReuseIdentifier: Constants.cellIdentificator)
        
        userInfoTableView.snp.makeConstraints { make in
            make.top.equalTo(userName).inset(view.frame.width / 8)
            make.left.equalToSuperview()
            make.width.equalTo(view.frame.width)
            make.height.equalTo(view.frame.height / 2)
        }
    }
    
    private func createLogOutButton() {
        view.addSubview(logOutButton)
        logOutButton.backgroundColor = .red
        logOutButton.setTitle("Выйти", for: .normal)
        logOutButton.addAction(UIAction(handler: { _ in self.logOut() }), for: .touchUpInside)
        logOutButton.layer.cornerRadius = 10
        logOutButton.snp.makeConstraints { make in
            make.top.equalTo(userInfoTableView).inset(view.frame.height / 2.3)
            make.width.equalTo(view.frame.width / 2)
            make.height.equalTo(view.frame.height / 20)
            make.centerX.equalToSuperview()
        }
    }
    
    private func logOut() {
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(SignUpViewController())
    }
}

// MARK: UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    
}

// MARK: UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user?.createUserFields().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = userInfoTableView.dequeueReusableCell(withIdentifier: Constants.cellIdentificator) as? UserInfoCell else { return UITableViewCell() }
        cell.infoLabel.text = user?.createUserFields()[indexPath.item].title
        cell.dataLabel.text = user?.createUserFields()[indexPath.item].value
        return cell
    }
}


fileprivate extension UserModel {
    func createUserFields() -> [InfoFields] {
        return [
            InfoFields.name(name),
            InfoFields.female(female),
            InfoFields.sex(sex),
            InfoFields.birth(dateOfBirth),
            InfoFields.number(phoneNumber),
            InfoFields.email(email)
        ]
    }
}
