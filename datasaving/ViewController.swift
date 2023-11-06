//
//  ViewController.swift
//  datasaving
//
//  Created by Mariam Mchedlidze on 05.11.23.
//

//
//  ViewController.swift
//  datasaving
//
//  Created by Mariam Mchedlidze on 05.11.23.
//

import UIKit

final class ViewController: UIViewController, UITextFieldDelegate {
    
    let loginStackview: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.spacing = 16
        return stackview
    }()
    
    let userTextField: UITextField = {
        let userText = UITextField()
        return userText
    }()
    
    let passwordTextField: UITextField = {
        let passwordText = UITextField()
        return passwordText
    }()
    
    let signinButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIsetup()
        UIconstraint()
    }
    
    private func UIsetup() {
        userSetup()
        passwordSetup()
        buttonSetup()
        AddtoView()
    }
    
    private func userSetup() {
        userTextField.text = "User"
        userTextField.font = .systemFont(ofSize: 14, weight: .regular)
        userTextField.textColor = UIColor(red: 95/255, green: 95/255, blue: 95/255, alpha: 1)
        userTextField.layer.borderColor = CGColor(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
        userTextField.layer.borderWidth = 1.0
        userTextField.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        userTextField.layer.cornerRadius = 16
        userTextField.delegate = self
    }
    
    private func passwordSetup() {
        passwordTextField.text = "Password"
        passwordTextField.font = .systemFont(ofSize: 14, weight: .regular)
        passwordTextField.textColor = UIColor(red: 95/255, green: 95/255, blue: 95/255, alpha: 1)
        passwordTextField.layer.borderColor = CGColor(red: 178/255, green: 178/255, blue: 178/255, alpha: 1)
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        passwordTextField.layer.cornerRadius = 16
        passwordTextField.delegate = self
    }
    
    private func buttonSetup() {
        signinButton.setTitle("Sign in", for: .normal)
        signinButton.setTitleColor(.white, for: .normal)
        signinButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        signinButton.layer.cornerRadius = 10
        signinButton.backgroundColor = UIColor(red: 34/255, green: 87/255, blue: 122/255, alpha: 1)
        signinButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }
    
    private func AddtoView() {
        view.backgroundColor = .white
        view.addSubview(loginStackview)
        view.addSubview(signinButton)
        loginStackview.addArrangedSubview(userTextField)
        loginStackview.addArrangedSubview(passwordTextField)
    }
    
    private func UIconstraint() {
        stackviewConstraints()
        buttonConstraints()
    }
    
    private func stackviewConstraints() {
        loginStackview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginStackview.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            loginStackview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userTextField.widthAnchor.constraint(equalToConstant: 240),
            userTextField.heightAnchor.constraint(equalToConstant: 40),
            passwordTextField.widthAnchor.constraint(equalToConstant: 240),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func buttonConstraints() {
        signinButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signinButton.topAnchor.constraint(equalTo: loginStackview.bottomAnchor, constant: 32),
            signinButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signinButton.widthAnchor.constraint(equalToConstant: 120),
            signinButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    @objc private func signInButtonTapped() {
           let noteListVC = NoteListViewController() // 
           navigationController?.pushViewController(noteListVC, animated: true)
       }
    
}
