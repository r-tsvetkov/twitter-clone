//
// Created by Роман Цветков on 19.05.2020.
// Copyright (c) 2020 Roman Tsvetkov. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Properties
    private let logoImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "TwitterLogo")
        return iv
    }()
    
    private lazy var emailContainerView: UIView = {
        let image = #imageLiteral(resourceName: "ic_mail_outline_white_2x-1")
        let view = Utilities.createInputContainerView(withImage: image, textField: emailTextField)
        
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let image = #imageLiteral(resourceName: "ic_lock_outline_white_2x")
        let view = Utilities.createInputContainerView(withImage: image, textField: passwordTextField)
        
        return view
    }()
    
    private let emailTextField: UITextField = {
        let textField = Utilities.createTextField(withPlaceholder: "Email")
        textField.autocapitalizationType = .none
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = Utilities.createTextField(withPlaceholder: "Password")
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = Utilities.createMainButton(withTitle: "Log In")
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        
        return button
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = Utilities.createAttributedButton("Don't have an account?", " Sign Up")
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    @objc func handleLogin() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        AuthServece.shared.logInUser(email: email, password: password) { (result, error) in
            if let error = error {
                print("Login error: \(error.localizedDescription)")
                return
            }
            
            guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
            guard let tab = window.rootViewController as? MainTabController else { return }
            tab.authenticateUserAndConfigureUI()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func handleShowSignUp() {
        let signUpVC = SignUpController()
        
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(logoImage)
        logoImage.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImage.setDimensions(width: 150, height: 150)
        
        let stackView = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.anchor(
            top: logoImage.bottomAnchor,
            left: view.leftAnchor,
            right: view.rightAnchor,
            paddingLeft: 32,
            paddingRight: 32
        )
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(
            left: view.leftAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            right: view.rightAnchor,
            paddingLeft: 40,
            paddingRight: 40
        )
    }
}
