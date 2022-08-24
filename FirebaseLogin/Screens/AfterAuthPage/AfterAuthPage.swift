//
//  AfterAuthPage.swift
//  FirebaseLogin
//
//  Created by Lucas Pinto on 11/08/22.
//

import UIKit

class AfterAuthPage: UIView {

    lazy var authLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Parabéns!!!"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .yellow
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(self.authLabel)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.authLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            self.authLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
}
