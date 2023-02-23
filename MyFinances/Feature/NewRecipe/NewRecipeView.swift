//
//  NewRecipeView.swift
//  MyFinances
//
//  Created by Douglas  Rodrigues  on 23/02/23.
//

import UIKit

class NewRecipeView: UIView {
    
    lazy var nameRecipe: UITextField = {
        let field = UITextField.textFieldUI.textUI(text: "Nome")
        field.translatesAutoresizingMaskIntoConstraints = false
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    lazy var valueRecipe: UITextField = {
        let field = UITextField.textFieldUI.texNumberPadtUI(text: "Valor")
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(nameRecipe)
        nameRecipe.topAnchor.constraint(equalTo: topAnchor, constant: 32).isActive = true
        nameRecipe.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        nameRecipe.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        nameRecipe.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        addSubview(valueRecipe)
        valueRecipe.topAnchor.constraint(equalTo: nameRecipe.bottomAnchor, constant: 12).isActive = true
        valueRecipe.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        valueRecipe.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        valueRecipe.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
