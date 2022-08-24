//
//  ViewController.swift
//  FirebaseLogin
//
//  Created by Lucas Pinto on 09/08/22.
//

import UIKit
import FirebaseAuth

class LoginController: UIViewController {

    var loginView: LoginView?
    var auth: Auth?

    override func loadView() {
        super.loadView()
        self.loginView = LoginView()
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 48/255, green: 79/255, blue: 85/255, alpha: 1.0)
        self.loginView?.configDelegate(delegate: self)
        self.loginView?.delegate(delegate: self)
        self.auth = Auth.auth()
    }
}

extension LoginController: UITextFieldDelegate, LoginScreenProtocol {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.loginView?.verifyNotEmpty()
    }
    
    func actionLoginButton() {
        
        let email:String = self.loginView?.loginTextField.text ?? ""
        let password: String = self.loginView?.passwordTextField.text ?? ""
        
        self.auth?.signIn(withEmail: email, password: password, completion: { result, error in
            if error != nil {
                print("Email ou senha não cadastrados")
            } else {
                self.navigationController?.pushViewController(AfterAuthController(), animated: true)
            }
        })
    }
    
    func actionRegisterButton() {
        let registerVC: RegistrationViewController = RegistrationViewController()
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
}
