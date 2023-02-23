//
//  ExtensionsUIText.swift
//  MyFinances
//
//  Created by Douglas  Rodrigues  on 23/02/23.
//

import UIKit

extension UITextField {
    
    static let textFieldUI = UITextField()
    
    func textUI(text: String) -> UITextField {
        let field = UITextField()
        field.placeholder = text
        field.textContentType = .username
        field.textColor = .black
        //field.keyboardType = .numberPad
        field.layer.borderWidth = 1.0
        field.layer.cornerRadius = 5
        field.backgroundColor = .white
        field.layer.borderColor = UIColor(red: 0.855, green: 0.855, blue: 0.855, alpha: 1).cgColor
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: field.frame.height))
        field.leftViewMode = .always
        return field
    }
    
    func texNumberPadtUI(text: String) -> UITextField {
        let field = UITextField()
        field.placeholder = text
        field.textContentType = .username
        field.textColor = .black
        field.keyboardType = .numberPad
        field.layer.borderWidth = 1.0
        field.layer.cornerRadius = 5
        field.backgroundColor = .white
        field.layer.borderColor = UIColor(red: 0.855, green: 0.855, blue: 0.855, alpha: 1).cgColor
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: field.frame.height))
        field.leftViewMode = .always
        return field
    }
}
