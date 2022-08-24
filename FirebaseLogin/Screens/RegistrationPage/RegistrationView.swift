//
//  RegistrationView.swift
//  FirebaseLogin
//
//  Created by Lucas Pinto on 09/08/22.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func actionSubscribeButton()
}

class RegistrationView: UIView {
    
    weak private var delegate: RegisterScreenProtocol?
    
    
    func delegate(delegate: RegisterScreenProtocol) {
        self.delegate = delegate
    }
    
    lazy var cadastroLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.text = "Cadastro"
        return label
    }()

    lazy var userLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 61/255, green: 176/255, blue: 199/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Campo do usuário:"
        return label
    }()
    
    lazy var userTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.autocapitalizationType = .none
        return tf
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 61/255, green: 176/255, blue: 199/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Campo de email:"
        return label
    }()
    
    lazy var emailTextField: UITextField = {
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
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Campo da senha:"
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.autocapitalizationType = .none
        return tf
    }()
    
    lazy var passwordConfirmationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 61/255, green: 176/255, blue: 199/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Campo de confirmação de senha:"
        return label
    }()
    
    lazy var passwordConfirmationTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.autocapitalizationType = .none
        return tf
    }()
    
    lazy var subscribeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.backgroundColor = UIColor(red: 61/255, green: 176/255, blue: 199/255, alpha: 1.0)
        button.addTarget(self, action: #selector(self.tappedSubscribeButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSubViews()
        self.configConstraints()
        self.verifyNotEmptyRegistration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func tappedSubscribeButton() {
        self.delegate?.actionSubscribeButton()
    }
    
    public func configDelegate(delegate: UITextFieldDelegate) {
        self.userTextField.delegate = delegate
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
        self.passwordConfirmationTextField.delegate = delegate
    }
    
    public func verifyNotEmptyRegistration() {
        let user: String = self.userTextField.text ?? ""
        let email: String = self.emailTextField.text ?? ""
        let password: String = self.passwordTextField.text ?? ""
        let passwordConfirmation: String = self.passwordConfirmationTextField.text ?? ""
        
        if !user.isEmpty && !email.isEmpty && !password.isEmpty && !passwordConfirmation.isEmpty {
            buttonEnabler(enable: true)
        } else {
            buttonEnabler(enable: false)
        }
    }
    
    private func buttonEnabler(enable: Bool) {
        if enable {
            self.subscribeButton.setTitleColor(.white , for: .normal)
            self.subscribeButton.isEnabled = true
        } else {
            self.subscribeButton.setTitleColor(.blue, for: .normal)
            self.subscribeButton.isEnabled = false
        }
    }
    
    func configSubViews() {
        self.addSubview(self.cadastroLabel)
        self.addSubview(self.userLabel)
        self.addSubview(self.userTextField)
        self.addSubview(self.emailLabel)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordLabel)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.passwordConfirmationLabel)
        self.addSubview(self.passwordConfirmationTextField)
        self.addSubview(self.subscribeButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.cadastroLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 10),
            self.cadastroLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            self.userLabel.topAnchor.constraint(equalTo: self.cadastroLabel.bottomAnchor, constant: 30),
            self.userLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            
            self.userTextField.topAnchor.constraint(equalTo: self.userLabel.bottomAnchor, constant: 3),
            self.userTextField.leadingAnchor.constraint(equalTo: self.userLabel.leadingAnchor),
            self.userTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            self.userTextField.heightAnchor.constraint(equalToConstant: 35),
            
            self.emailLabel.topAnchor.constraint(equalTo: self.userTextField.bottomAnchor, constant: 18),
            self.emailLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 3),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.userTextField.leadingAnchor),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 35),
            
            self.passwordLabel.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 18),
            self.passwordLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.passwordLabel.bottomAnchor, constant: 3),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.userTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 35),
            
            self.passwordConfirmationLabel.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 18),
            self.passwordConfirmationLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            
            self.passwordConfirmationTextField.topAnchor.constraint(equalTo: self.passwordConfirmationLabel.bottomAnchor, constant: 3),
            self.passwordConfirmationTextField.leadingAnchor.constraint(equalTo: self.userTextField.leadingAnchor),
            self.passwordConfirmationTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            self.passwordConfirmationTextField.heightAnchor.constraint(equalToConstant: 35),
            
            self.subscribeButton.topAnchor.constraint(equalTo: self.passwordConfirmationTextField.bottomAnchor, constant: 20),
            self.subscribeButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            self.subscribeButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
