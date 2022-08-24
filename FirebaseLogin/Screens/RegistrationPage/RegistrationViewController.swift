//
//  RegistrationViewController.swift
//  FirebaseLogin
//
//  Created by Lucas Pinto on 09/08/22.
//

import Foundation
import UIKit
import FirebaseAuth

class RegistrationViewController: UIViewController {
    
    var auth: Auth?
    
    var registerView: RegistrationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 48/255, green: 79/255, blue: 85/255, alpha: 1.0)
        self.registerView?.configDelegate(delegate: self)
        self.registerView?.delegate(delegate: self)
        self.auth = Auth.auth()
    }
    
    override func loadView() {
        super.loadView()
        self.registerView = RegistrationView()
        self.view = registerView
    }
}

extension RegistrationViewController: UITextFieldDelegate, RegisterScreenProtocol {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.registerView?.verifyNotEmptyRegistration()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func actionSubscribeButton() {
        
        let email:String = self.registerView?.emailTextField.text ?? ""
        let password: String = self.registerView?.passwordTextField.text ?? ""
        
        self.auth?.createUser(withEmail: email, password: password, completion: { result, error in
            if error != nil {
                print("Erro ao cadastrar \(error)")
            } else {
                print("Sucesso ao cadastrar")
            }
        })
    }
}
