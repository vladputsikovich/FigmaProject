//
//  RegistrationViewController.swift
//  FigmaProject
//
//  Created by Владислав Пуцыкович on 5.02.22.
//

import Foundation
import UIKit
import DTTextField

// MARK: Constants

fileprivate struct Constants {
    static let logoImageNmae = "bag"
    static let sexList = ["Мужской", "Женский"]
    static let apllyButtonTitle = "Зарегистрироваться"
    static let nameTextFieldPlaceholder = "Имя"
    static let femaleTextFieldPlaceholder = "Фамилия"
    static let sexTextFieldPlaceholder = "Пол"
    static let birthTextFieldPlaceholder = "Дата рождения"
    static let numberTextFieldPlaceholder = "Номер телефона"
    static let emailTextFieldPlaceholder = "Email"
    static let loginTextFieldPlaceholder = "Логин"
    static let passwordTextFieldPlaceholder = "Пароль"
    static let repeatPasswordTextFieldPlaceholder = "Повторите пароль"
}

class RegistrationViewCrontroller: UIViewController {
    
    // MARK: Property
    
    private var scrollView = UIScrollView()
    
    private var logoImage = UIImageView()
    
    private var textFieldsStackView = UIStackView()
    
    private let nameTextField = DTTextField()
    private let femaleTextField = DTTextField()
    private let sexTextField = DTTextField()
    private let birthTextField = DTTextField()
    private let numberTextField = DTTextField()
    private let emailTextField = DTTextField()
    private let loginTextField = DTTextField()
    private let passwordTextField = DTTextField()
    private let repeatPasswordTextField = DTTextField()
    
    private let sexPicker = UIPickerView()
    private let datePicker = UIDatePicker()
    
    private var applyButton = UIButton()
    
    // MARK: APP Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createScrollView()
        createImageView()
        createTextFieldsStackView()
        createApplyButton()
    }
    
    // MARK: Methods for create views
    
    private func createScrollView() {
        scrollView = UIScrollView(frame: view.frame)
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
    }
    
    private func createImageView() {
        logoImage = UIImageView(
            frame: CGRect(
                x: view.frame.width / 4,
                y: view.frame.width / 4,
                width: view.frame.width / 2,
                height: view.frame.width / 2
            )
        )
        logoImage.image = UIImage(named: Constants.logoImageNmae)
        scrollView.addSubview(logoImage)
    }
    
    private func createTextFieldsStackView() {
        textFieldsStackView = UIStackView(
            frame: CGRect(
                x: 20,
                y: logoImage.frame.maxY + view.frame.width / 4,
                width: view.frame.width - 40,
                height: 700
            )
        )
        textFieldsStackView.axis = .vertical
        textFieldsStackView.distribution = .fillEqually
        textFieldsStackView.spacing = 20
        
        nameTextField.placeholder = Constants.nameTextFieldPlaceholder
        nameTextField.dtLayer.backgroundColor = UIColor.systemGray5.cgColor
        textFieldsStackView.addArrangedSubview(nameTextField)
        
        femaleTextField.placeholder = Constants.femaleTextFieldPlaceholder
        femaleTextField.dtLayer.backgroundColor = UIColor.systemGray5.cgColor
        textFieldsStackView.addArrangedSubview(femaleTextField)
        
        sexTextField.placeholder = Constants.sexTextFieldPlaceholder
        sexTextField.dtLayer.backgroundColor = UIColor.systemGray5.cgColor
        sexPicker.dataSource = self
        sexPicker.delegate = self
        sexTextField.inputView = sexPicker
        textFieldsStackView.addArrangedSubview(sexTextField)
        
        birthTextField.placeholder = Constants.birthTextFieldPlaceholder
        birthTextField.dtLayer.backgroundColor = UIColor.systemGray5.cgColor
        createDatePicker()
        textFieldsStackView.addArrangedSubview(birthTextField)
        
        numberTextField.placeholder = Constants.numberTextFieldPlaceholder
        numberTextField.dtLayer.backgroundColor = UIColor.systemGray5.cgColor
        textFieldsStackView.addArrangedSubview(numberTextField)
        
        emailTextField.placeholder = Constants.emailTextFieldPlaceholder
        emailTextField.dtLayer.backgroundColor = UIColor.systemGray5.cgColor
        textFieldsStackView.addArrangedSubview(emailTextField)
        
        loginTextField.placeholder = Constants.loginTextFieldPlaceholder
        loginTextField.dtLayer.backgroundColor = UIColor.systemGray5.cgColor
        textFieldsStackView.addArrangedSubview(loginTextField)
        
        passwordTextField.placeholder = Constants.passwordTextFieldPlaceholder
        passwordTextField.dtLayer.backgroundColor = UIColor.systemGray5.cgColor
        textFieldsStackView.addArrangedSubview(passwordTextField)
        
        repeatPasswordTextField.placeholder = Constants.repeatPasswordTextFieldPlaceholder
        repeatPasswordTextField.dtLayer.backgroundColor = UIColor.systemGray5.cgColor
        textFieldsStackView.addArrangedSubview(repeatPasswordTextField)
        
        scrollView.addSubview(textFieldsStackView)
    }
    
    private func createDatePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: nil,
            action: #selector(donePressed)
        )
        toolbar.setItems([doneBtn], animated: true)
        birthTextField.inputAccessoryView = toolbar
        
        birthTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
    }
    
    @objc private func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        birthTextField.text = dateFormatter.string(from: datePicker.date)
        birthTextField.resignFirstResponder()
    }
    
    private func createApplyButton() {
        applyButton = UIButton(
            frame: CGRect(
                x: 20,
                y: textFieldsStackView.frame.maxY + 20,
                width: view.frame.width - 40,
                height: 50
            )
        )
        applyButton.setTitle(Constants.apllyButtonTitle, for: .normal)
        applyButton.backgroundColor = .blue
        applyButton.layer.cornerRadius = 10
        applyButton.addAction(UIAction(handler: { _ in  self.register()}), for: .touchUpInside)
        scrollView.addSubview(applyButton)
        scrollView.contentSize = CGSize(width: view.frame.width, height: applyButton.frame.maxY)
    }
    
    private func register() {
        let model = UserModel()
        model.name = nameTextField.text ?? ""
        model.female = femaleTextField.text ?? ""
        model.sex = sexTextField.text ?? ""
        model.dateOfBirth = birthTextField.text ?? ""
        model.email = emailTextField.text ?? ""
        model.login = loginTextField.text ?? ""
        model.password = passwordTextField.text ?? ""
        model.isLogined = false
        
        let result = RegisterService().register(model: model)
        
        if result.0 {
            let alert = UIAlertController(title: "Успешно", message: result.1, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default) { (alert) in
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Ошибка", message: result.1, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
}

// MARK: UIPickerViewDataSource, UIPickerViewDelegate

extension RegistrationViewCrontroller: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.sexList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Constants.sexList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sexTextField.text = Constants.sexList[row]
        sexTextField.resignFirstResponder()
    }
}

