//
//  InitialFinanceView.swift
//  MyFinances
//
//  Created by Douglas  Rodrigues  on 20/02/23.
//

import UIKit

protocol InitialFinanceViewDelegate: AnyObject {
    func recipeButton()
    func expenseButton()
}

class InitialFinanceView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: InitialFinanceViewDelegate?
    
    let cell = "cell"
    
    lazy var balanceView: BalanceView = {
        let balanceView = BalanceView()
        balanceView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        return balanceView
    }()
    
    lazy var suggestionView: SuggestionView = {
        let suggestionView = SuggestionView()
        return suggestionView
    }()
    
    lazy var buttonsView: ButtonsView = {
        let buttonsView = ButtonsView()
        buttonsView.heightAnchor.constraint(equalToConstant: 73).isActive = true
        return buttonsView
    }()
    
    lazy var titleBudgetLabel: UILabel = {
        let label = UILabel()
        label.text = "Orçamento"
        label.font = UIFont(name: "Roboto-Bold", size: 22)
        label.textColor = UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 1)
        return label
    }()
    
    lazy var plusBudgetButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.layer.backgroundColor = UIColor(red: 0.591, green: 0.591, blue: 0.596, alpha: 1).cgColor
        button.backgroundColor = .white
        return button
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.allowsSelection = false
        table.register(InitialFinanceCell.self, forCellReuseIdentifier: cell)
        table.rowHeight = 71
        return table
    }()
    
    lazy var cardBudgetView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 0.925, green: 0.925, blue: 0.925, alpha: 1).cgColor
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 278).isActive = true
        return view
    }()
    
    lazy var lineBudgetView: UIView = {
        let view = UIView()
        view.bounds = bounds.insetBy(dx: -1, dy: -1)
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 0.925, green: 0.925, blue: 0.925, alpha: 1).cgColor
        return view
    }()
    
    lazy var cardsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [balanceView, buttonsView, cardBudgetView])
        stack.axis = .vertical
        stack.spacing = 12
        return stack
    }()
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        return sv
      }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
      }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buttonsView.delegate = self
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        cardBudgetView.addSubview(titleBudgetLabel)
        cardBudgetView.addSubview(plusBudgetButton)
        cardBudgetView.addSubview(lineBudgetView)
        cardBudgetView.addSubview(tableView)
        contentView.addSubview(cardsStackView)
        contentView.addSubview(suggestionView)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        cardsStackView.translatesAutoresizingMaskIntoConstraints = false
        cardsStackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        cardsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        cardsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        
        titleBudgetLabel.translatesAutoresizingMaskIntoConstraints = false
        titleBudgetLabel.topAnchor.constraint(equalTo: cardBudgetView.topAnchor, constant: 12).isActive = true
        titleBudgetLabel.leadingAnchor.constraint(equalTo: cardBudgetView.leadingAnchor, constant: 16).isActive = true
        
        plusBudgetButton.translatesAutoresizingMaskIntoConstraints = false
        plusBudgetButton.topAnchor.constraint(equalTo: cardBudgetView.topAnchor, constant: 21).isActive = true
        plusBudgetButton.trailingAnchor.constraint(equalTo: cardBudgetView.trailingAnchor, constant: -22.19).isActive = true
        plusBudgetButton.widthAnchor.constraint(equalToConstant: 12.38).isActive = true
        plusBudgetButton.heightAnchor.constraint(equalToConstant: 13).isActive = true
        
        lineBudgetView.translatesAutoresizingMaskIntoConstraints = false
        lineBudgetView.topAnchor.constraint(equalTo: titleBudgetLabel.bottomAnchor, constant: 12).isActive = true
        lineBudgetView.leadingAnchor.constraint(equalTo: cardBudgetView.leadingAnchor, constant: 18).isActive = true
        lineBudgetView.trailingAnchor.constraint(equalTo: cardBudgetView.trailingAnchor, constant: -18).isActive = true
        lineBudgetView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: lineBudgetView.bottomAnchor, constant: 12).isActive = true
        tableView.leadingAnchor.constraint(equalTo: cardBudgetView.leadingAnchor, constant: 16).isActive = true
        tableView.trailingAnchor.constraint(equalTo: cardBudgetView.trailingAnchor, constant: -16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: cardBudgetView.bottomAnchor, constant: -12).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 197).isActive = true
        
        suggestionView.translatesAutoresizingMaskIntoConstraints = false
        suggestionView.topAnchor.constraint(equalTo: cardBudgetView.bottomAnchor, constant: 36).isActive = true
        suggestionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        suggestionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        suggestionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -86).isActive = true
        suggestionView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Delegate

extension InitialFinanceView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as! InitialFinanceCell
        
        if indexPath.row == 0 {
            cell.titleCellBudgetLabel.text = "Novo Carro"
            cell.valueInitialCellBudgetLabel.text = "R$ 2.000,00"
            cell.valueFinalCellBudgetLabel.text = "R$ 80.000,00"
            cell.progressValueView.setProgress(0.5, animated: false)
        }
        
        if indexPath.row == 1 {
            cell.titleCellBudgetLabel.text = "TV"
            cell.valueInitialCellBudgetLabel.text = "R$ 3.000,00"
            cell.valueFinalCellBudgetLabel.text = "R$ 3.500,00"
            cell.progressValueView.setProgress(0.9, animated: false)
        }
        
        if indexPath.row == 2 {
            cell.titleCellBudgetLabel.text = "Férias das Maldivas"
            cell.valueInitialCellBudgetLabel.text = "R$ 1,50"
            cell.valueFinalCellBudgetLabel.text = "R$ 200.000,00"
            cell.progressValueView.setProgress(0.01, animated: false)
        }
        
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 3 {
            cell.lineValueView.isHidden = true
        }
        return cell
    }
}

extension InitialFinanceView: ButtonsViewDelegate {
    func recipeButton() {
        delegate?.recipeButton()
    }
    
    func expenseButton() {
        delegate?.expenseButton()
    }
}
