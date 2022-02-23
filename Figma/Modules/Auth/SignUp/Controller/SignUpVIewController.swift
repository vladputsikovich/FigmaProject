//
//  SignUpVIewController.swift
//  Figma
//
//  Created by Владислав Пуцыкович on 5.02.22.
//

import Foundation
import UIKit
import DTTextField

// MARK: Constants

fileprivate struct Constants {
    static let logoImageName = "bag"
    static let loginTextFieldPlaceholder = "Логин"
    static let passwordTextFieldPlaceholder = "Пароль"
    static let signUpButtonTitle = "Войти"
    static let registerButtonTitle = "Зарегистрироваться"
    static let textFieldsStackViewSpacing: CGFloat = 20
    static let buttonsStackViewSpacing: CGFloat = 30
    static let leadingPadding: CGFloat = 20
    static let trailingPadding: CGFloat = -20
    static let cornerRadiusForButton: CGFloat = 10
}

class SignUpViewController: UIViewController {
    
    // MARK: Property
    
    private let textFiledsStackView = UIStackView()
    private let buttonsStackView = UIStackView()
    
    private var logoImage = UIImageView()
    private var loginTextField = DTTextField()
    private var passwordTextField = DTTextField()
    
    private var signUpButton = UIButton()
    private var registerButton = UIButton()
    
    // MARK: APP lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createImageView()
        createTextFieldsStackView()
        createButtonStackView()
    }
    
    // MARK: Func for create methods
    
    private func createImageView() {
        view.addSubview(logoImage)
        logoImage.image = UIImage(named: Constants.logoImageName)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            logoImage.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: view.frame.height / 8
            ),
            logoImage.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            logoImage.heightAnchor.constraint(
                equalToConstant: view.frame.height / 5
            ),
            logoImage.widthAnchor.constraint(
                equalToConstant: view.frame.height / 6
            )
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func createTextFieldsStackView() {
        view.addSubview(textFiledsStackView)
        textFiledsStackView.translatesAutoresizingMaskIntoConstraints = false
        textFiledsStackView.axis = .vertical
        textFiledsStackView.distribution = .fillEqually
        textFiledsStackView.spacing = Constants.textFieldsStackViewSpacing
        
        textFiledsStackView.addArrangedSubview(loginTextField)
        textFiledsStackView.addArrangedSubview(passwordTextField)
        
        loginTextField.placeholder = Constants.loginTextFieldPlaceholder
        loginTextField.dtLayer.backgroundColor = UIColor.systemGray5.cgColor
        
        passwordTextField.placeholder = Constants.passwordTextFieldPlaceholder
        passwordTextField.dtLayer.backgroundColor = UIColor.systemGray5.cgColor
        passwordTextField.isSecureTextEntry = true
        
        let constraints = [
            textFiledsStackView.topAnchor.constraint(
                equalTo: logoImage.bottomAnchor,
                constant: view.frame.height / 8
            ),
            textFiledsStackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.leadingPadding
            ),
            textFiledsStackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.trailingPadding
            ),
            textFiledsStackView.heightAnchor.constraint(
                equalToConstant: view.frame.height / 6
            )
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func createButtonStackView() {
        view.addSubview(buttonsStackView)
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.axis = .vertical
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = Constants.buttonsStackViewSpacing
        buttonsStackView.addArrangedSubview(signUpButton)
        buttonsStackView.addArrangedSubview(registerButton)
        
        signUpButton.setTitle(Constants.signUpButtonTitle, for: .normal)
        signUpButton.backgroundColor = .lagune
        signUpButton.layer.cornerRadius = Constants.cornerRadiusForButton
        signUpButton.addAction(UIAction(handler: { _ in self.loginUser() }), for: .touchUpInside)
        
        registerButton.setTitle(Constants.registerButtonTitle, for: .normal)
        registerButton.backgroundColor = .blue
        registerButton.layer.cornerRadius = Constants.cornerRadiusForButton
        registerButton.addAction(UIAction(handler: { _ in self.goToRegistration() }), for: .touchUpInside)
        
        let constraints = [
            buttonsStackView.topAnchor.constraint(
                equalTo: textFiledsStackView.bottomAnchor,
                constant: view.frame.height / 10
            ),
            buttonsStackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.leadingPadding
            ),
            buttonsStackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.trailingPadding
            ),
            buttonsStackView.heightAnchor.constraint(
                equalToConstant: view.frame.height / 6
            )
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func loginUser() {
        let result = LoginService().login(
            loginName: loginTextField.text ?? "",
            password: passwordTextField.text ?? ""
        )
        if result {
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(MainTapBarViewController())
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Неверный логин и пароль", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: Func for push to rigister 
    
    private func goToRegistration() {
        let vc = RegistrationViewCrontroller()
        navigationController?.pushViewController(vc, animated: true)
    }
}
