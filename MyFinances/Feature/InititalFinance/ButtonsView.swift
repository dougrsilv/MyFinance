//
//  ButtonsView.swift
//  MyFinances
//
//  Created by Douglas  Rodrigues  on 24/02/23.
//

import UIKit

protocol ButtonsViewDelegate: AnyObject {
    func recipeButton()
    func expenseButton()
}

class ButtonsView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: ButtonsViewDelegate?
    
    lazy var newRecipeButton: UIButton = {
        var button = UIButton(type: .system)
        button.layer.backgroundColor = UIColor(red: 0.354, green: 0.679, blue: 0.201, alpha: 1).cgColor
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(newRecipe), for: .touchUpInside)
        return button
    }()
    
    lazy var textNewRecipeLabel: UILabel = {
        let label = UILabel()
        label.text = "NOVA RECEITA"
        label.font = UIFont(name: "Roboto-Bold", size: 12)
        label.textColor = .white
        return label
    }()
    
    lazy var imageNewRecipeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "+")
        return image
    }()
    
    lazy var textNewExpenseLabel: UILabel = {
        let label = UILabel()
        label.text = "NOVA DESPESA"
        label.font = UIFont(name: "Roboto-Bold", size: 12)
        label.textColor = .white
        return label
    }()
    
    lazy var imageNewExpenseImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "-")
        return image
    }()
    
    lazy var newExpenseButton: UIButton = {
        var button = UIButton(type: .system)
        button.layer.backgroundColor = UIColor(red: 0.762, green: 0.264, blue: 0.264, alpha: 1).cgColor
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(newExpense), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [newRecipeButton, newExpenseButton])
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fillEqually
        stack.heightAnchor.constraint(equalToConstant: 73).isActive = true
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(buttonStackView)
        newRecipeButton.addSubview(imageNewRecipeImage)
        newRecipeButton.addSubview(textNewRecipeLabel)
        newExpenseButton.addSubview(imageNewExpenseImage)
        newExpenseButton.addSubview(textNewExpenseLabel)
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        buttonStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        imageNewRecipeImage.translatesAutoresizingMaskIntoConstraints = false
        imageNewRecipeImage.topAnchor.constraint(equalTo: newRecipeButton.topAnchor, constant: 15).isActive = true
        imageNewRecipeImage.centerXAnchor.constraint(equalTo: newRecipeButton.centerXAnchor).isActive = true

        textNewRecipeLabel.translatesAutoresizingMaskIntoConstraints = false
        textNewRecipeLabel.topAnchor.constraint(equalTo: imageNewRecipeImage.bottomAnchor, constant: 14.49).isActive = true
        textNewRecipeLabel.centerXAnchor.constraint(equalTo: newRecipeButton.centerXAnchor).isActive = true
        
        imageNewExpenseImage.translatesAutoresizingMaskIntoConstraints = false
        imageNewExpenseImage.topAnchor.constraint(equalTo: newExpenseButton.topAnchor, constant: 22).isActive = true
        imageNewExpenseImage.centerXAnchor.constraint(equalTo: newExpenseButton.centerXAnchor).isActive = true

        textNewExpenseLabel.translatesAutoresizingMaskIntoConstraints = false
        textNewExpenseLabel.topAnchor.constraint(equalTo: imageNewExpenseImage.bottomAnchor, constant: 14.49).isActive = true
        textNewExpenseLabel.centerXAnchor.constraint(equalTo: newExpenseButton.centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func newRecipe() {
        delegate?.recipeButton()
    }
    
    @objc func newExpense() {
        delegate?.expenseButton()
    }
}
