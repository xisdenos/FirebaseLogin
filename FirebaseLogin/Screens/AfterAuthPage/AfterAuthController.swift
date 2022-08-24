//
//  AfterAuthController.swift
//  FirebaseLogin
//
//  Created by Lucas Pinto on 09/08/22.
//

import Foundation
import UIKit

class AfterAuthController: UIViewController {
    
    var afterAuthScreen: AfterAuthPage?
    
    override func loadView() {
        super.loadView()
        self.afterAuthScreen = AfterAuthPage()
        self.view = afterAuthScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
