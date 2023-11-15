//
//  ViewController.swift
//  vk
//
//  Created by nastasya on 26.06.2023.
//

import UIKit

final class AuthorizationViewController: UIViewController {
    
    private let logoImageView = UIImageView()
    private let loginTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = UIButton()
    private let passwordRecoveryButton = UIButton()
    private let signInButton = UIButton()
    private let textColor = UIColor.white
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue.withAlphaComponent(0.98)
        let hideKeyboardGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard(_ :)))
        view.addGestureRecognizer(hideKeyboardGestureRecognizer)
        setupSignInButton()
        setupLoginButton()
        setupPasswordTextField()
        setupLoginTextField()
        setupPasswordRecoveryButton()
        setupLogoImageView()
        setupConstraints()
        let nearBottomConstraints = [
            passwordTextField.bottomAnchor.constraint(equalToSystemSpacingBelow: loginButton.topAnchor, multiplier: 1.0)
        ]
        view.keyboardLayoutGuide.setConstraints(nearBottomConstraints, activeWhenNearEdge: .top)
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.navigationBar.isTranslucent = true
    }
    
    private func setupLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "logo")
    }
    
    private func setupLoginTextField() {
        view.addSubview(loginTextField)
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.borderStyle = .roundedRect
        loginTextField.layer.cornerRadius = 17
        loginTextField.clipsToBounds = true
        loginTextField.backgroundColor = .white.withAlphaComponent(0.2)
        loginTextField.attributedPlaceholder = NSAttributedString(
            string: "Email или телефон",
            attributes: [.foregroundColor: UIColor.white]
        )
        loginTextField.textColor = .white
    }
    
    private func setupPasswordTextField() {
        view.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.layer.cornerRadius = 17
        passwordTextField.clipsToBounds = true
        passwordTextField.isSecureTextEntry = true
        passwordTextField.backgroundColor = .white.withAlphaComponent(0.2)
        passwordTextField.textColor = .white
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Пароль",
            attributes: [.foregroundColor: UIColor.white]
        )
    }
    
    private func setupPasswordRecoveryButton() {
        view.addSubview(passwordRecoveryButton)
        passwordRecoveryButton.translatesAutoresizingMaskIntoConstraints = false
        passwordRecoveryButton.setAttributedTitle(
            NSAttributedString(string: "Забыли?",
            attributes: [.font: UIFont.systemFont(ofSize: 14, weight: .medium),
                         .foregroundColor: UIColor.white.withAlphaComponent(0.8)]),
            for: .normal
        )
        passwordRecoveryButton.contentHorizontalAlignment = .leading
    }
    
    private func setupLoginButton() {
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.backgroundColor = .white
        loginButton.layer.cornerRadius = 17
        loginButton.clipsToBounds = true
        loginButton.setAttributedTitle(
            NSAttributedString(string: "Войти",
                               attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .semibold),
                         .foregroundColor: UIColor.systemBlue]),
            for: .normal
        )
        loginButton.setTitleColor(.gray, for: .selected)
        loginButton.addTarget(self, action: #selector(loginButtonPressed(_ :)), for: .touchUpInside)
    }
    
    private func setupSignInButton() {
        view.addSubview(signInButton)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.setAttributedTitle(
            NSAttributedString(string: "Зарегистрироваться?",
            attributes: [.font: UIFont.systemFont(ofSize: 17, weight: .medium),
                         .foregroundColor: UIColor.white]),
            for: .normal
        )
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -80),
            
            loginTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -15),
            loginTextField.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            loginTextField.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
            
            passwordTextField.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70),
            
            passwordRecoveryButton.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            passwordRecoveryButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5),
            passwordRecoveryButton.widthAnchor.constraint(equalToConstant: 180),
            
            loginButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -60),
            loginButton.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor, constant: -60),
            loginButton.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor, constant: 60),
            
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -10)
        ])
    }
    
    @objc func loginButtonPressed(_ loginButton: UIButton) {
//        if loginTextField.hasText && passwordTextField.hasText {
//            let tabBarController = createTabBarController()
//            tabBarController.modalPresentationStyle = .fullScreen
//            present(tabBarController, animated: true)
//        } else {
//            let alertController = UIAlertController(title: "", message: "Неверно введены логин и/или пароль", preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "Ок", style: .destructive))
//            present(alertController, animated: true)
//        }
        let tabBar = TabBarBuilder.createTabBarController()
        tabBar.tabBar.backgroundColor = .darkGray.withAlphaComponent(0.3)
        tabBar.modalPresentationStyle = .fullScreen
        present(tabBar, animated: true)
    }
    
    @objc func hideKeyboard(_: UIView) {
        view.endEditing(true)
    }
}

