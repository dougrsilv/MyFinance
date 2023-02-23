//
//  NewExpenseView.swift
//  MyFinances
//
//  Created by Douglas  Rodrigues  on 23/02/23.
//

import UIKit

class NewExpenseView: UIView {
    
    // MARK: - Properties
    
    let pickerView = UIPickerView()
    let products = ["Nenhum", "Novo Carro", "TV", "Férias nas Maldivas"]
    
    lazy var nameRecipe: UITextField = {
        let field = UITextField.textFieldUI.textUI(text: "Nome")
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    lazy var valueRecipe: UITextField = {
        let field = UITextField.textFieldUI.texNumberPadtUI(text: "Valor")
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    lazy var categoryRecipe: UITextField = {
        let field = UITextField.textFieldUI.textUI(text: "Categoria")
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    // MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        categoryRecipe.inputView = pickerView
        
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
        
        addSubview(categoryRecipe)
        categoryRecipe.topAnchor.constraint(equalTo: valueRecipe.bottomAnchor, constant: 12).isActive = true
        categoryRecipe.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        categoryRecipe.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        categoryRecipe.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UIPicker

extension NewExpenseView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return products.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return products[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryRecipe.text = products[row]
        categoryRecipe.resignFirstResponder()
    }
}
