//
//  LoginView.swift
//  FirebaseLogin
//
//  Created by Lucas Pinto on 09/08/22.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func actionLoginButton()
    func actionRegisterButton()
}

class LoginView: UIView {
    
    weak var delegate:LoginScreenProtocol?
    
    func delegate(delegate:LoginScreenProtocol?) {
        self.delegate = delegate
    }

    lazy var logoImage: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "logo")
        logo.contentMode = .scaleAspectFit
        return logo
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 61/255, green: 176/255, blue: 199/255, alpha: 1.0)
        label.text = "Digite seu email:"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var loginTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.autocapitalizationType = .none
        return tf
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 61/255, green: 176/255, blue: 199/255, alpha: 1.0)
        label.text = "Digite sua senha:"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.borderStyle = .roundedRect
        tf.backgroundColor = .white
        tf.keyboardType = .default
        tf.autocapitalizationType = .none
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.backgroundColor = UIColor(red: 61/255, green: 176/255, blue: 199/255, alpha: 1.0)
        button.addTarget(self, action: #selector(self.tappedSubmitButton), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    
    lazy var subscribeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 61/255, green: 176/255, blue: 199/255, alpha: 1.0)
        label.text = "Ainda não tem conta? "
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var subscribeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Inscreva-se", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.addTarget(self, action: #selector(tappedSubscribeButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSubviews()
        self.configConstraints()
        self.verifyNotEmpty()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configDelegate(delegate: UITextFieldDelegate) {
        self.loginTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc public func tappedSubmitButton() {
        self.delegate?.actionLoginButton()
    }
    
    @objc public func tappedSubscribeButton() {
        self.delegate?.actionRegisterButton()
    }
    
    public func verifyNotEmpty() {
        let email: String = self.loginTextField.text ?? ""
        let password: String = self.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty{
            buttonEnabler(enable: true)
        } else {
            buttonEnabler(enable: false)
        }
    }
    
    private func buttonEnabler(enable: Bool) {
        if enable {
            self.submitButton.setTitleColor(.white , for: .normal)
            self.submitButton.isEnabled = true
        } else {
            self.submitButton.setTitleColor(.blue, for: .normal)
            self.submitButton.isEnabled = false
        }
    }
    
    func configSubviews() {
        self.addSubview(self.logoImage)
        self.addSubview(self.loginLabel)
        self.addSubview(self.loginTextField)
        self.addSubview(self.passwordLabel)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.submitButton)
        self.addSubview(self.subscribeLabel)
        self.addSubview(self.subscribeButton)
    }
    
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.logoImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            self.logoImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.logoImage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            self.loginLabel.topAnchor.constraint(equalTo: self.logoImage.bottomAnchor, constant: 20),
            self.loginLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 25),
            
            self.loginTextField.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 3),
            self.loginTextField.leadingAnchor.constraint(equalTo: self.loginLabel.leadingAnchor),
            self.loginTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            self.loginTextField.heightAnchor.constraint(equalToConstant: 30),
            
            self.passwordLabel.topAnchor.constraint(equalTo: self.loginTextField.bottomAnchor, constant: 18),
            self.passwordLabel.leadingAnchor.constraint(equalTo: self.loginLabel.leadingAnchor),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.passwordLabel.bottomAnchor, constant: 3),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.loginTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.loginTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: loginTextField.heightAnchor),
            
            self.submitButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 24),
            self.submitButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            self.submitButton.widthAnchor.constraint(equalToConstant: 100),
            
            self.subscribeLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 66),
            self.subscribeLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -55),
            
            self.subscribeButton.leadingAnchor.constraint(equalTo: self.subscribeLabel.trailingAnchor, constant: -1),
            self.subscribeButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -49)
        ])
    }
}
