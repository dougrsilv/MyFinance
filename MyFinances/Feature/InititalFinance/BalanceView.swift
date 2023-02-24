//
//  BalanceView.swift
//  MyFinances
//
//  Created by Douglas  Rodrigues  on 24/02/23.
//

import UIKit

class BalanceView: UIView {
    
    // MARK: - Properties
    
    lazy var titleMyBalaceLabel: UILabel = {
        let label = UILabel()
        label.text = "Meu Saldo"
        label.font = UIFont(name: "Roboto-Bold", size: 12)
        label.textColor = UIColor(red: 0.633, green: 0.633, blue: 0.633, alpha: 1)
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.text = "R$ 1.000,00"
        label.font = UIFont(name: "Roboto-Bold", size: 32)
        label.textColor = UIColor(red: 0.325, green: 0.352, blue: 0.433, alpha: 1)
        return label
    }()
    
    lazy var updateLabel: UILabel = {
        let label = UILabel()
        label.text = "Última atualização"
        label.font = UIFont(name: "Roboto-Regular", size: 12)
        label.textColor = UIColor(red: 0.633, green: 0.633, blue: 0.633, alpha: 1)
        return label
    }()
    
    lazy var timeUpdateLabel: UILabel = {
        let label = UILabel()
        label.text = "09:41"
        label.font = UIFont(name: "Roboto-Bold", size: 12)
        label.textColor = UIColor(red: 0.633, green: 0.633, blue: 0.633, alpha: 1)
        return label
    }()
    
    lazy var lineValueView: UIView = {
        let view = UIView()
        view.bounds = bounds.insetBy(dx: -0.5, dy: -0.5)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.302, green: 0.362, blue: 0.896, alpha: 1).cgColor
        return view
    }()
    
    lazy var cardMyBalanceView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 0.925, green: 0.925, blue: 0.925, alpha: 1).cgColor
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 110).isActive = true
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(cardMyBalanceView)
        cardMyBalanceView.addSubview(titleMyBalaceLabel)
        cardMyBalanceView.addSubview(valueLabel)
        cardMyBalanceView.addSubview(lineValueView)
        
        cardMyBalanceView.translatesAutoresizingMaskIntoConstraints = false
        cardMyBalanceView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        cardMyBalanceView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        cardMyBalanceView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        titleMyBalaceLabel.translatesAutoresizingMaskIntoConstraints = false
        titleMyBalaceLabel.topAnchor.constraint(equalTo: cardMyBalanceView.topAnchor, constant: 12).isActive = true
        titleMyBalaceLabel.leadingAnchor.constraint(equalTo: cardMyBalanceView.leadingAnchor, constant: 19).isActive = true
        
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.topAnchor.constraint(equalTo: cardMyBalanceView.topAnchor, constant: 32).isActive = true
        valueLabel.leadingAnchor.constraint(equalTo: cardMyBalanceView.leadingAnchor, constant: 18).isActive = true
        
        lineValueView.translatesAutoresizingMaskIntoConstraints = false
        lineValueView.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 4).isActive = true
        lineValueView.leadingAnchor.constraint(equalTo: cardMyBalanceView.leadingAnchor, constant: 18).isActive = true
        lineValueView.trailingAnchor.constraint(equalTo: cardMyBalanceView.trailingAnchor, constant: -18).isActive = true
        lineValueView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        cardMyBalanceView.addSubview(updateLabel)
        updateLabel.translatesAutoresizingMaskIntoConstraints = false
        updateLabel.leadingAnchor.constraint(equalTo: cardMyBalanceView.leadingAnchor, constant: 18).isActive = true
        updateLabel.bottomAnchor.constraint(equalTo: cardMyBalanceView.bottomAnchor, constant: -12).isActive = true
        
        cardMyBalanceView.addSubview(timeUpdateLabel)
        timeUpdateLabel.translatesAutoresizingMaskIntoConstraints = false
        timeUpdateLabel.trailingAnchor.constraint(equalTo: cardMyBalanceView.trailingAnchor, constant: -18).isActive = true
        timeUpdateLabel.bottomAnchor.constraint(equalTo: cardMyBalanceView.bottomAnchor, constant: -12).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
