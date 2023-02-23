//
//  InitialFinanceCell.swift
//  MyFinances
//
//  Created by Douglas  Rodrigues  on 22/02/23.
//

import UIKit

class InitialFinanceCell: UITableViewCell {
    
    lazy var titleCellBudgetLabel: UILabel = {
        let label = UILabel()
        label.text = "Novo Carro"
        label.font = UIFont(name: "Roboto-Bold", size: 16)
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    lazy var valueInitialCellBudgetLabel: UILabel = {
        let label = UILabel()
        label.text = "R$ 3.000,00"
        label.font = UIFont(name: "Roboto-Bold", size: 12)
        label.textColor = UIColor(red: 0.762, green: 0.264, blue: 0.264, alpha: 1)
        return label
    }()
    
    lazy var valueFinalCellBudgetLabel: UILabel = {
        let label = UILabel()
        label.text = "R$ 80.000,00"
        label.font = UIFont(name: "Roboto-Bold", size: 12)
        label.textColor = UIColor(red: 0.54, green: 0.566, blue: 0.8, alpha: 1)
        return label
    }()
    
    lazy var progressValueView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.trackTintColor = UIColor(red: 0.937, green: 0.937, blue: 0.937, alpha: 1)
        progressView.progressTintColor = UIColor(red: 0.302, green: 0.362, blue: 0.896, alpha: 1)
        progressView.layer.cornerRadius = 6 / 2
        progressView.layer.masksToBounds = true
        return progressView
    }()
    
    lazy var lineValueView: UIView = {
        let view = UIView()
        view.bounds = bounds.insetBy(dx: -0.5, dy: -0.5)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.302, green: 0.362, blue: 0.896, alpha: 0.1).cgColor
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(lineValueView)
        lineValueView.translatesAutoresizingMaskIntoConstraints = false
        lineValueView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        lineValueView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lineValueView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        addSubview(titleCellBudgetLabel)
        titleCellBudgetLabel.translatesAutoresizingMaskIntoConstraints = false
        titleCellBudgetLabel.topAnchor.constraint(equalTo: lineValueView.bottomAnchor, constant: 8).isActive = true
        titleCellBudgetLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        addSubview(progressValueView)
        progressValueView.translatesAutoresizingMaskIntoConstraints = false
        progressValueView.topAnchor.constraint(equalTo: titleCellBudgetLabel.bottomAnchor, constant: 3).isActive = true
        progressValueView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        progressValueView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        progressValueView.heightAnchor.constraint(equalToConstant: 6).isActive = true

        addSubview(valueInitialCellBudgetLabel)
        valueInitialCellBudgetLabel.translatesAutoresizingMaskIntoConstraints = false
        valueInitialCellBudgetLabel.topAnchor.constraint(equalTo: progressValueView.bottomAnchor, constant: 4).isActive = true
        valueInitialCellBudgetLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true

        addSubview(valueFinalCellBudgetLabel)
        valueFinalCellBudgetLabel.translatesAutoresizingMaskIntoConstraints = false
        valueFinalCellBudgetLabel.topAnchor.constraint(equalTo: progressValueView.bottomAnchor, constant: 4).isActive = true
        valueFinalCellBudgetLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
